import 'package:counter_app_bloc/bloc/counter_bloc.dart';
import 'package:counter_app_bloc/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        
      ],
      child: MaterialApp(
        title: 'Counter App Bloc',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
