part of 'users_cubit.dart';

abstract class UsersCubitState {}

class UsersCubitInitial extends UsersCubitState {}

class UsersCubitLoading extends UsersCubitState {}

class UsersCubitSuccess extends UsersCubitState {
  final List<dynamic> users;
  UsersCubitSuccess({required this.users});
}

class UsersCubitFailure extends UsersCubitState {}
