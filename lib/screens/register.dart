import 'package:flutter/material.dart';
import 'package:gitako/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  String _email = '';
  String _fullName = '';
  String _password = '';
  String _phoneNumber = '';
  String _gender = '';
  String _age = '';
  String _address = '';
  String _city = '';
  String _state = '';
  String _farmName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                onSaved: (value) {
                  _fullName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) {
                  _password = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Gender'),
                onSaved: (value) {
                  _gender = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                onSaved: (value) {
                  _age = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) {
                  _address = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                onSaved: (value) {
                  _city = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'State'),
                onSaved: (value) {
                  _state = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Farm Name'),
                onSaved: (value) {
                  _farmName = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final response = await _authService.register(
          _email,
          _fullName,
          _password,
          _phoneNumber,
          _gender,
          _age,
          _address,
          _city,
          _state,
          _farmName,
        );
        // handle successful registration here like navigate to login page.
        print("Registration successful: $response");
      } catch (e) {
        print("Registration failed: $e");
      }
    }
  }
}
