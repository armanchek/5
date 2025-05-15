import 'package:flutter/material.dart';
import 'user_preferences.dart';
import 'home_screen.dart';

class UserFormScreen extends StatefulWidget {
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  void _saveData() async {
    if (_formKey.currentState!.validate()) {
      await UserPreferences.saveUser(
        _nameController.text.trim(),
        _emailController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Введите данные')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Имя'),
                validator: (value) => value!.isEmpty ? 'Введите имя' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.contains('@') ? null : 'Некорректный email',
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveData,
                child: Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
