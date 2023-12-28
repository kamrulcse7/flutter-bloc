import 'package:counter_app_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return (state is CounterUpdate)
                    ? Text(
                        state.counter.toString(),
                        style: const TextStyle(
                          fontSize: 40.0,
                        ),
                      )
                    : const Text(
                        "0",
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      );
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrese());
                  },
                  child: Icon(Icons.remove),
                ),
                
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrese());
                  },
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
