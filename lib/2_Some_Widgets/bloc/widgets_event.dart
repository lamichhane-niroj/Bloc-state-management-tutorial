
// for switch 
class SwitchToggleEvent{}

// for slider
class SliderSlideEvent{
  double value;
  SliderSlideEvent(this.value);
}

// for radiobutton
class RadioPressedEvent{
  int value;
  RadioPressedEvent(this.value);
}

// for checkbutton
class CheckPressedEvent{}

// for dropdownbutton
class DropDownPressedEvent{
  int value;
  DropDownPressedEvent(this.value);
}