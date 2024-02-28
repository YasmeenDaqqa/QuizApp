part of 'profle_cubit.dart';
sealed class ProfleState {}

final class ProfleInitial extends ProfleState {}

final class ProfleLoading extends ProfleState {}

final class ProfleLoaded extends ProfleState {
   final List<usersModel> user;
 
  ProfleLoaded(this.user);
}

final class ProfleError extends ProfleState {
  final String message;
  ProfleError(this.message);
}