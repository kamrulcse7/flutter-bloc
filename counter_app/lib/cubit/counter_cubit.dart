import 'package:counter_app/cubit/counter_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterCubitState>{
  CounterCubit():super(CubitInitial());
  int counter = 0;
  void increment(){
    counter++;
    emit(CunterValueUpdated(counter: counter));
  }
  
  void decrement(){
    counter--;
    emit(CunterValueUpdated(counter: counter));
  }
}
