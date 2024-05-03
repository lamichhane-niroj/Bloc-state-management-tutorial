import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  InternetConnectionBloc() : super(InternetConnectionInitial()) {
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnected()));
    on<InternetDisconnectedEvent>(
        (event, emit) => emit(InternetDisconnected()));

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (result) {
        if (result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.mobile)) {
          add(InternetConnectedEvent());
        } else {
          add(InternetDisconnectedEvent());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
