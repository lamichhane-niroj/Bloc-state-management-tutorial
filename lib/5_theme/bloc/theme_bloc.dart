import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/5_theme/bloc/theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(false) {
    on<SwitchThemeEvent>((event, emit) {
      if (state) {
        emit(false);
      } else {
        emit(true);
      }
    });
  }
}
