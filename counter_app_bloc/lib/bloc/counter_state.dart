part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState();
}

final class CounterInitial extends CounterState {
  @override
  List<Object> get props => [];
}

class CounterUpdate extends CounterState {
  final int counter;
  CounterUpdate(this.counter);

  @override
  List<Object> get props => [counter];
}
