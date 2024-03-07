import 'package:ecommerce_appe/models/announcement_model.dart';
import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_appe/models/fav_Products_model.dart';
import 'package:ecommerce_appe/services/firestore_service.dart';
import 'package:ecommerce_appe/services/auth_services.dart';

import 'package:ecommerce_appe/services/cart_services.dart';
import 'package:ecommerce_appe/services/favorit_services.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
    final favoriteServices = FavoriteServicesImpl();
  final authServices = AuthServicesImpl();
  List<ProductItemModel> favoriteProducts = [];

  Future<void> deleteCartItem(ProductItemModel favorite) async {
  emit(FavoriteLoading());
  try {
   
       final currentUser = await authServices.currentUser();
    await favoriteServices.deleteFavoriteItem(currentUser!.uid, favorite);
    emit(FavoriteDeleted (favoriteId: favorite.id));
  } catch (e) {
    emit(FavoriteError(message: e.toString()));
  }
}
  void addFavorite(ProductItemModel product) {
    favoriteProducts.add(product);
    emit(FavoriteLoaded(favoriteProducts));
  }

  void removeFavorite(ProductItemModel product) {
    favoriteProducts.remove(product);
    emit(FavoriteLoaded(favoriteProducts));
  }

  void getFavoriteData() async {
    emit(FavoriteLoading());
    try {
      // Extract unique categories from dummyProducts
      final favorite = favProducts.map((product) => product.category).toSet().toList();
      await Future.delayed(const Duration(seconds: 2));
      emit(FavoriteLoaded(favProducts));
    } catch (e) {
      emit(FavoriteError(message: e.toString()));
    }
  }
  void toggleFavorite(ProductItemModel product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
    emit(FavoriteLoaded(favProducts));
  }
  
  final firestoreService = FirestoreService.instance;

  void getFavoriteProducts() async {
    emit(FavoriteLoading());
    try {
      final currentUser = await AuthServicesImpl().currentUser();
     
      final favProducts = await firestoreService.collectionStream<ProductItemModel>(
        path: 'users/${currentUser!.uid}/favorites',
        builder: (data, documentId) => ProductItemModel.fromMap(data, documentId),
      ).first;
      emit(FavoriteLoaded(favProducts));
    } catch (e) {
      emit(FavoriteError(message: e.toString()));
    }
  }
}