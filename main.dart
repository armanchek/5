import 'package:flutter/material.dart';
import 'user_preferences.dart';
import 'login_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<Widget> _getInitialScreen() async {
    final isLoggedIn = await UserPreferences.isLoggedIn();
    return isLoggedIn ? HomeScreen() : LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Auth App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: FutureBuilder<Widget>(
        future: _getInitialScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return snapshot.data!;
        },
      ),
    );
  }
}
