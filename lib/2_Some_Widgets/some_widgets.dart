import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/2_Some_Widgets/bloc/widgets_bloc.dart';
import 'package:flutter_bloc_tutorial/2_Some_Widgets/bloc/widgets_event.dart';

class SomeWidgets extends StatelessWidget {
  const SomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build widget is rebuild");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // switch
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dark Mode"),
              const SizedBox(
                width: 5,
              ),
              BlocBuilder<SwitchWidgetBloc, bool>(
                builder: (context, state) {
                  print("Only Switch widget is rebuild");
                  return Switch(
                      value: state,
                      onChanged: (value) {
                        BlocProvider.of<SwitchWidgetBloc>(context)
                            .add(SwitchToggleEvent());
                      });
                },
              ),
            ],
          ),

          const Divider(
            color: Colors.black,
            thickness: 3,
          ),

          // slider
          Column(
            children: [
              const Text("Please select a value"),
              BlocBuilder<SliderWidgetBloc, double>(
                builder: (context, state) {
                  print("Only Slider widget is rebuild");
                  return Slider(
                      value: state,
                      onChanged: (value) {
                        BlocProvider.of<SliderWidgetBloc>(context)
                            .add(SliderSlideEvent(value));
                      });
                },
              ),
            ],
          ),

          const Divider(
            color: Colors.black,
            thickness: 3,
          ),

          // checkbox
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("I agree"),
              BlocBuilder<CheckWidgetBloc, bool>(
                builder: (context, state) {
                  print("Only CheckButton widget is rebuild");
                  return Checkbox(
                      value: state,
                      onChanged: (value) {
                        BlocProvider.of<CheckWidgetBloc>(context)
                            .add(CheckPressedEvent());
                      });
                },
              ),
            ],
          ),

          const Divider(
            color: Colors.black,
            thickness: 3,
          ),

          // radio button
          BlocBuilder<RadioWidgetBloc, int>(
            builder: (context, state) {
              print("Only RadioButton widget is rebuild");
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Option 1"),
                      Radio(
                        value: 1,
                        groupValue: state,
                        onChanged: (value) {
                          BlocProvider.of<RadioWidgetBloc>(context)
                              .add(RadioPressedEvent(value!));
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Option 2"),
                      Radio(
                          value: 2,
                          groupValue: state,
                          onChanged: (value) {
                            BlocProvider.of<RadioWidgetBloc>(context)
                                .add(RadioPressedEvent(value!));
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Option 3"),
                      Radio(
                          value: 3,
                          groupValue: state,
                          onChanged: (value) {
                            BlocProvider.of<RadioWidgetBloc>(context)
                                .add(RadioPressedEvent(value!));
                          }),
                    ],
                  ),
                ],
              );
            },
          ),

          const Divider(
            color: Colors.black,
            thickness: 3,
          ),

          // dropdown menu
          BlocBuilder<DropDownWidgetBloc, int?>(
            builder: (context, state) {
              print("Only DropDownMenu widget is rebuild");
              return DropdownButton(
                  value: state,
                  hint: const Text("Select a subject"),
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text("Physics"),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Chemistry"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Mathematics"),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text("Geology"),
                    ),
                    DropdownMenuItem(
                      value: 4,
                      child: Text("Botany"),
                    ),
                  ],
                  onChanged: (value) {
                    BlocProvider.of<DropDownWidgetBloc>(context)
                        .add(DropDownPressedEvent(value!));
                  });
            },
          )
        ],
      ),
    );
  }
}
