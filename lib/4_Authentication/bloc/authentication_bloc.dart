import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {


  AuthenticationBloc(bool isUserLogin) : super(AuthenticationInitial()) {
    on<AuthenticatedEvent>((event, emit) {
      emit(Authenticated());
    });


    on<UnAuthenticatedEvent>((event, emit) {
      emit(UnAuthenticated());
    });

    if(isUserLogin){
      add(AuthenticatedEvent());
    }else{
      add(UnAuthenticatedEvent());
    }
  }
}
