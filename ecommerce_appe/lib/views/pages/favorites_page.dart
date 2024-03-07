import 'package:ecommerce_appe/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_appe/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:ecommerce_appe/utils/route/app_routes.dart';
import 'package:ecommerce_appe/models/fav_Products_model.dart';
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getFavoriteProducts(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoriteError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is FavoriteLoaded) {
            final favoriteProducts = state.favProducts;
            return ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return ProductItem(productItem: product);
              },
            );
          } else {
            return const SizedBox(); // Return an empty container if state is not recognized
          }
        },
      ),
    );
  }
}
