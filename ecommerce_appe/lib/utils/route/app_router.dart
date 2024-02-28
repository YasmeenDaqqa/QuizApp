import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:ecommerce_appe/utils/route/app_routes.dart';
import 'package:ecommerce_appe/view_models/product_details_cubit.dart/product_details_cubit.dart';
import 'package:ecommerce_appe/views/pages/custom_bottom_navbar.dart';
import 'package:ecommerce_appe/views/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_appe/views/pages/login_page.dart';
class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final product = settings.arguments as ProductItemModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDetailsCubit();
              cubit.getProductDetails(product.id);
              return cubit;
            },
            child: const ProductDetailsPage(),
          ),
          settings: settings,
        );
      case AppRoutes.bottomNavbar:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );
      case AppRoutes.homeLogin:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error Page!'),
            ),
          ),
        );
    }
  }
}