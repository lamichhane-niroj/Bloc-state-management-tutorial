part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class Authenticated extends AuthenticationState {}

final class UnAuthenticated extends AuthenticationState {}


