// ignore_for_file: must_be_immutable

part of 'user_cubit.dart';

sealed class UserCubitState extends Equatable {
  const UserCubitState();
}

class UserCubitInit extends UserCubitState {
  @override
  List<Object> get props => [];
}

class UserCubitLoading extends UserCubitState {
  @override
  List<Object> get props => [];
}

class UserCubitLoaded extends UserCubitState {
  UserCubitLoaded({required this.userList});

  List<UserModel> userList;
  @override
  List<Object> get props => [userList];
}

class UserCubitError extends UserCubitState {
  String message;
  UserCubitError({required this.message});

  @override
  List<Object> get props => [message];
}
