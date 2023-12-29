import 'package:equatable/equatable.dart';
import 'package:rest_api_bloc/models/user_model.dart';

abstract class UserState extends Equatable {}

class UserInit extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDataLoded extends UserState {
  List<UserModel> userList;
  UserDataLoded(this.userList);

  @override
  // TODO: implement props
  List<Object?> get props => [userList];
}

class UserError extends UserState {
  String message;
  UserError(this.message);
  
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
