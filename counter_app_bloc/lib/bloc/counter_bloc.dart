import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrese>((event, emit) {
      counter = counter + 1;
      emit(CounterUpdate(counter));
    });
    on<CounterDecrese>((event, emit) {
      counter = counter - 1;
      emit(CounterUpdate(counter));
    });
  }
}
