import 'package:flutter/material.dart';
import 'user_form_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Авторизация')),
      body: Center(
        child: ElevatedButton(
          child: Text('Войти'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => UserFormScreen()),
            );
          },
        ),
      ),
    );
  }
}
