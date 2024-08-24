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
  String _confirmPassword = '';
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
      body: SingleChildScrollView(
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) {
                  _password = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                onSaved: (value) {
                  _confirmPassword = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  return null;
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

      // Validate password and confirmPassword match
      if (_password != _confirmPassword) {
        _showErrorDialog('Passwords do not match');
        return;
      }

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

        // Navigate to the login screen after successful registration
        Navigator.pushReplacementNamed(context, '/login');
      } catch (e) {
        print("Registration failed: $e");
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  } // End ErrorDailog

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Success'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  } // End SuccessDialog
}
