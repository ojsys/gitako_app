import 'package:flutter/material.dart';

class AddFarmStaffScreen extends StatefulWidget {
  @override
  _AddFarmStaffScreenState createState() => _AddFarmStaffScreenState();
}

class _AddFarmStaffScreenState extends State<AddFarmStaffScreen> {
  final _formKey = GlobalKey<FormState>();
  String _staffName = '';
  String _staffRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Farm Staff'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Staff Name'),
                onSaved: (value) {
                  _staffName = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the staff name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Role'),
                onSaved: (value) {
                  _staffRole = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the staff role';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Staff'),
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

      // Call API to add staff to the farm
      // Handle response, e.g., show a success message or navigate back to the dashboard
    }
  }
}
