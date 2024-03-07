import 'package:ecommerce_appe/models/announcement_model.dart';
import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_appe/services/home_services.dart';
import 'package:ecommerce_appe/services/auth_services.dart';
import 'package:ecommerce_appe/models/fav_Products_model.dart';
import 'package:ecommerce_appe/services/firestore_service.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final homeServices = HomeServicesImpl();
 final authServices = AuthServicesImpl();
  void getHomeData() async {
    emit(HomeLoading());
    try {
      final products = await homeServices.getProducts();
      final announcements = await homeServices.getAnnouncement();
        
      emit(HomeLoaded(products, announcements));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
  void addToFavorites(ProductItemModel product) async {
  emit(AddingToFavorites());
  try {
    final currentUser = await authServices.currentUser();
    await FirestoreService.instance.addToFavorites(currentUser!.uid, product);
    emit(AddedToFavorites());
  } catch (e) {
    emit(AddToFavoritesError(e.toString()));
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