import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_cubit/cubit/user_cubit.dart';
import 'package:rest_api_cubit/models/user_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getAllUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state) {
          if (state is UserCubitLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserCubitError) {
            return Center(child: Text(state.message.toString()));
          } else if (state is UserCubitLoaded) {
            return ListView.separated(
              itemBuilder: (context, index) {
                UserModel user = state.userList[index];
                return Card(
                  child: ListTile(
                    title: Text(user.name.toString()),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10.0),
              itemCount: state.userList.length,
            );
          } else {
            return Center(
                child: Text("Something went wrong. Please try again"));
          }
        },
      ),
    );
  }
}
