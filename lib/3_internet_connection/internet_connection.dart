import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/3_internet_connection/bloc/internet_connection_bloc.dart';
import 'package:lottie/lottie.dart';

class InternetConnection extends StatelessWidget {
  const InternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: BlocBuilder<InternetConnectionBloc, InternetConnectionState>(
        builder: (context, state) {
          if (state is InternetConnected) {
            return const Text("You are connected to Internet", style: TextStyle(fontSize: 20),);
          }
          return Column(
            children: [
              Lottie.asset('assets/Animation_Internet.json'),
            ],
          );
        },
      ),
    ));
  }
}
