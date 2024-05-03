// This file contains all the possible event of our counter app
// so what are the events for counter app: For now increment and decrement

abstract class CounterEvent{}

class CounterIncrementEvent extends CounterEvent{}

class CounterDecrementEvent extends CounterEvent{}