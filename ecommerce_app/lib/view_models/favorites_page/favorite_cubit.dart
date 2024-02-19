import 'package:ecommerce_app/models/announcement_model.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<ProductItemModel> favoriteProducts = [];
  void getFavoriteData() async {
    emit(FavoriteLoading());
    try {
      // Extract unique categories from dummyProducts
      final favorite = favProducts.map((product) => product.category).toSet().toList();
      await Future.delayed(const Duration(seconds: 2));
      emit(FavoriteLoaded(favorite));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
  void toggleFavorite(ProductItemModel product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
    } else {
      favoriteProducts.add(product);
    }
    emit(FavoriteLoaded(favoriteProducts.map((product) => product.category).toList()));
  }
}