part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}


final class ProductLoaded extends ProductState {
  final List<ProductItemModel> products;
  final List<AnnouncementModel> announcements;
    //final ProductItemModel product;
  ProductLoaded(this.products, this.announcements);
}

final class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
final class AddingToFavorites extends ProductState {}

final class AddedToFavorites extends ProductState {}

final class AddToFavoritesError extends ProductState{
  final String message;

  AddToFavoritesError(this.message);
}