import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/1_Counter_App/bloc/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/1_Counter_App/bloc/counter_event.dart';
// import 'package:flutter_bloc_tutorial/1_Counter_App/bloc/counter_state.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  // int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // BlocBuilder<CounterBloc, CounterState>(
            //   builder: (context, state) {
            //     if (state is CounterInitialState) {
            //       _counter = 0;
            //     }
            //     if (state is CounterIncrementState) {
            //       _counter += 1;
            //     }
            //     if (state is CounterDecrementState) {
            //       _counter -= 1;
            //     }
            //     return Text(
            //       '$_counter',
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
            BlocBuilder<CounterBloc2, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // BlocProvider.of<CounterBloc>(context)
              //     .add(CounterIncrementEvent());

              BlocProvider.of<CounterBloc2>(context)
                  .add(CounterIncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 30,
          ),
          FloatingActionButton(
            onPressed: () {
              // BlocProvider.of<CounterBloc>(context)
              //     .add(CounterDecrementEvent());

              BlocProvider.of<CounterBloc2>(context)
                  .add(CounterDecrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
