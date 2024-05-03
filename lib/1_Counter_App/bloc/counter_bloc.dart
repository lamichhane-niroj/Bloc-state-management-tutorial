// This file connects the state and event file
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/1_Counter_App/bloc/counter_event.dart';
import 'package:flutter_bloc_tutorial/1_Counter_App/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // initial state is set at first so we can set the value of counter to zero.
  CounterBloc() : super(CounterInitialState()) {
    // here we write the body for what event what state should be emitted
    // We are defining the body as when the increment event is called it should emit the state to increment, so we can increment the value.
    on<CounterIncrementEvent>(
      (event, emit) {
        emit(CounterIncrementState());
        print("Counter Increment State");
      },
    );

    // We are defining the body as when the decrement event is called it should emit the state to decrement, so we can decrement the value.
    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState());
      print("Counter Decrement State");
    });
  }
}


// Alternate way to do it is 
class CounterBloc2 extends Bloc<CounterEvent, int>{
  // here we are defining our state as integer directly
  CounterBloc2(): super(0){
    // when increment is called we increment the state which is integer by 1
    on<CounterIncrementEvent>((event, emit) {
      emit(state + 1);
    });

    // when decrement is called we decrement the state which is integer by 1
    on<CounterDecrementEvent>((event, emit) {
      emit(state - 1);
    });
  }
}
