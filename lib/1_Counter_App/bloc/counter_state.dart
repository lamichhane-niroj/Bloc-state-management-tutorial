// This file contains all the possible states of our counter app
// so what are the states for counter app: For now initial(0), increment(value + 1), decrement(value - 1)

abstract class CounterState{}

class CounterInitialState extends CounterState{}

class CounterIncrementState extends CounterState{}

class CounterDecrementState extends CounterState{}