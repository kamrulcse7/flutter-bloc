// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class CounterCubitState extends Equatable{
  const CounterCubitState();
} 

 class CubitInitial extends CounterCubitState {
  @override
  List<Object?> get props => [];
 }


class CunterValueUpdated extends CounterCubitState{
  int counter;
  CunterValueUpdated({required this.counter});
    @override
  List<Object?> get props => [counter];
}