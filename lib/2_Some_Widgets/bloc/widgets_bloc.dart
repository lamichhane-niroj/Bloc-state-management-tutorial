import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/2_Some_Widgets/bloc/widgets_event.dart';

class SliderWidgetBloc extends Bloc<SliderSlideEvent, double> {
  SliderWidgetBloc() : super(0.0) {
    on<SliderSlideEvent>((event, emit) {
      emit(event.value);
    });
  }
}

class SwitchWidgetBloc extends Bloc<SwitchToggleEvent, bool> {
  SwitchWidgetBloc() : super(false) {
    on<SwitchToggleEvent>((event, emit) {
      if (state == true) {
        emit(false);
      } else {
        emit(true);
      }
    });
  }
}


class CheckWidgetBloc extends Bloc<CheckPressedEvent, bool> {
  CheckWidgetBloc() : super(false) {
    on<CheckPressedEvent>((event, emit) {
      if (state == true) {
        emit(false);
      } else {
        emit(true);
      }
    });
  }
}


class RadioWidgetBloc extends Bloc<RadioPressedEvent, int>{
  RadioWidgetBloc() : super(-1){
    on<RadioPressedEvent>((event, emit){
      emit(event.value);
    });
  }
}

class DropDownWidgetBloc extends Bloc<DropDownPressedEvent, int?>{
  DropDownWidgetBloc() : super(null){
     on<DropDownPressedEvent>((event, emit){
      emit(event.value);
    });
  }
  

}

