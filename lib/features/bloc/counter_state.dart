part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

sealed class CounterActionState extends CounterState{}

final class CounterInitial extends CounterState {}

class IncrementCounter extends CounterState{
  final int val;

  IncrementCounter({required this.val});
}

class ShowSnakBar extends CounterActionState{}

class IncrementCounterActionState extends CounterActionState{}
