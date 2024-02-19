part of 'profle_cubit.dart';
sealed class ProfleState {}

final class ProfleInitial extends ProfleState {}

final class ProfleLoading extends ProfleState {}

final class ProfleLoaded extends ProfleState {
   final List<String> favorite;
  ProfleLoaded(this.favorite);
}

final class ProfleError extends ProfleState {
  final String message;
  ProfleError(this.message);
}