import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_bloc/bloc/user_bloc.dart';
import 'package:rest_api_bloc/bloc/user_event.dart';
import 'package:rest_api_bloc/bloc/user_state.dart';
import 'package:rest_api_bloc/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserError) {
              return Center(child: Text(state.message.toString()));
            } else if (state is UserDataLoded) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  UserModel user = state.userList[index];
                  return Card(
                    child: ListTile(
                      title: Text(user.name.toString()),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15.0),
                itemCount: state.userList.length,
              );
            } else {
              return Center(
                  child: Text("Something went wrong. Please try again"));
            }
          },
        ),
      ),
    );
  }
}
