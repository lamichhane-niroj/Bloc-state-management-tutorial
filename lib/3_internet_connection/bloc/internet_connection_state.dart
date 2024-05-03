part of 'internet_connection_bloc.dart';

@immutable
sealed class InternetConnectionState {}

final class InternetConnectionInitial extends InternetConnectionState {}

final class InternetConnected extends InternetConnectionState {}

final class InternetDisconnected extends InternetConnectionState{}
