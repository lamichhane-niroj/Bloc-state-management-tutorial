import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/1_Counter_App/bloc/counter_bloc.dart';
import 'package:flutter_bloc_tutorial/2_Some_Widgets/bloc/widgets_bloc.dart';
import 'package:flutter_bloc_tutorial/3_internet_connection/bloc/internet_connection_bloc.dart';
// import 'package:flutter_bloc_tutorial/2_Some_Widgets/some_widgets.dart';
// import 'package:flutter_bloc_tutorial/3_internet_connection/internet_connection.dart';
import 'package:flutter_bloc_tutorial/4_Authentication/authentication.dart';
import 'package:flutter_bloc_tutorial/4_Authentication/bloc/authentication_bloc.dart';
import 'package:flutter_bloc_tutorial/5_theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc_tutorial/5_theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool islogin = prefs.getBool('islogin') ?? false;
  runApp(MyApp(
    isLogin: islogin,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(create: (context) => CounterBloc2()),
        BlocProvider(
          create: (context) => SliderWidgetBloc(),
        ),
        BlocProvider(
          create: (context) => CheckWidgetBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchWidgetBloc(),
        ),
        BlocProvider(
          create: (context) => RadioWidgetBloc(),
        ),
        BlocProvider(
          create: (context) => DropDownWidgetBloc(),
        ),
        BlocProvider(create: (context) => InternetConnectionBloc()),
        BlocProvider(
          create: (context) => AuthenticationBloc(isLogin),
        ),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, isLightMode) {
          return MaterialApp(
            title: 'Bloc Tutorial',
            debugShowCheckedModeBanner: false,
            theme: _buildTheme(isLightMode),
            home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return const HomePage();
                } else {
                  return const SignInPage();
                }
              },
            ),
          );
        },
      ),
    );
  }

  _buildTheme(bool isLightMode) {
    if (isLightMode) {
      return AppTheme.brightTheme;
    } else {
      return AppTheme.darkTheme;
    }
  }
}
