import 'package:ecommerce_appe/models/announcement_model.dart';
import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_appe/services/home_services.dart';
import 'package:ecommerce_appe/services/auth_services.dart';
import 'package:ecommerce_appe/models/fav_Products_model.dart';
import 'package:ecommerce_appe/services/firestore_service.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final homeServices = HomeServicesImpl();
 final authServices = AuthServicesImpl();
  void getHomeData() async {
    emit(ProductLoading());
    try {
      final products = await homeServices.getProducts();
      final announcements = await homeServices.getAnnouncement();
       //  final product = await homeServices.getProduct(productId);
      emit(ProductLoaded(products, announcements));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

   /* Future<void> addToCart(String productId) async {
    emit(AddingToFavorites());
    try {
      final product = await homeServices.getProduct(productId);
      final cartOrder = favModel(
        id: DateTime.now().toIso8601String(),
        product: product,
    
      );
      final currentUser = await authServices.currentUser();
      await homeServices.addToCart(currentUser!.uid, cartOrder);
      emit(AddedToFavorites());
    } catch (e) {
      emit(AddToFavoritesError(e.toString()));
    }
  }*/

 
}