import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rest_api_cubit/models/user_model.dart';
import 'package:rest_api_cubit/services/api_services.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];
  UserCubit() : super(UserCubitInit());

  void getAllUserList() async {
    try {
      emit(UserCubitLoading());
      userList = await APIServices().getData();
      emit(UserCubitLoaded(userList: userList));
    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}
