// here we will not use the firebase concept but we will use share preference to store the boolean variable (isAuthenticated) locally in app.
// So if isAuthenticated is true we will navigate to home screen else to signin page

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/5_theme/bloc/theme_bloc.dart';
import 'package:flutter_bloc_tutorial/5_theme/bloc/theme_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.lock,
              size: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Email"),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () async {
                  // after validation we will set the islogin to true
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('islogin', true);

                  // and navigate to homepage
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                child: const Text("Sign In to App"))
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                // if logout is pressed we will simply set value to false
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('islogin', false);

                // and navigate to signin page
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                ));
              },
              icon: const Icon(Icons.logout)),
          BlocBuilder<ThemeBloc, bool>(
            builder: (context, state) {
              return Switch(
                  value: state,
                  onChanged: (value) {
                    BlocProvider.of<ThemeBloc>(context).add(SwitchThemeEvent());
                  });
            },
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              size: 200,
            ),
            Text(
              "Home Page Starts here....",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
