part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AuthenticatedEvent extends AuthenticationEvent{}

class UnAuthenticatedEvent extends AuthenticationEvent{}
