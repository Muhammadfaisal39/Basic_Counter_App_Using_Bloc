import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>(counterIncrementEvent);
    on<ShowSnakBarEvent>(showSnakBarEvent);
    on<CounterIncrementActionEvent>(counterIncrementActionEvent);
  }

  int val = 0;

  FutureOr<void> counterIncrementEvent(CounterIncrementEvent event, Emitter<CounterState> emit) {
    val = val + 1;
    emit(IncrementCounter(val: val));
  }

  FutureOr<void> showSnakBarEvent(ShowSnakBarEvent event, Emitter<CounterState> emit) {
    emit(ShowSnakBar());
  }

  FutureOr<void> counterIncrementActionEvent(CounterIncrementActionEvent event, Emitter<CounterState> emit) {
    emit(IncrementCounterActionState());
  }
}
