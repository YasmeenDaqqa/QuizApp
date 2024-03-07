part of 'favorite_cubit.dart';
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
 // final List<String> favorite;
   final List<ProductItemModel> favProducts;
  FavoriteLoaded(this.favProducts);
}
final class FavoriteDeleted extends FavoriteState {
   final String favoriteId;

  FavoriteDeleted ({required this.favoriteId});
}
final class FavoriteError extends FavoriteState {
  final String message;

 FavoriteError({
    required this.message,
  });
}