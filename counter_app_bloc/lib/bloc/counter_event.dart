part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();


}

class CounterIncrese extends CounterEvent{
  @override
  List<Object> get props => [];
}


class CounterDecrese extends CounterEvent{
    @override
  List<Object> get props => [];
}