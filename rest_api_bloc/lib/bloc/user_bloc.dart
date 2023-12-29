import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_bloc/bloc/user_event.dart';
import 'package:rest_api_bloc/bloc/user_state.dart';
import 'package:rest_api_bloc/models/user_model.dart';
import 'package:rest_api_bloc/services/api_services.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  List<UserModel> userList = [];

  UserBloc() : super(UserInit()) {
    on<GetUserList>((event, emit) async {
      try {
        emit(UserLoading());
        userList = await APIServices().getData();
        emit(UserDataLoded(userList));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
