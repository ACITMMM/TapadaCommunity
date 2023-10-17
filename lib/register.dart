import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:tapadacommunity/auth.dart';
import 'welcome.dart';

import 'dart:convert';
import 'dart:typed_data'; 


class RegisterPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _sex = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final List<String> staticSexValues = ['Male', 'Female', 'Prefer not to inform'];

  final cacheManager = CacheManager(
    Config(
      'register',
      stalePeriod: Duration(days: 90),
    ),
  );

  bool _validateEmail(String value) {
    // Basic email validation
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(value);
  }

  void _registerWithEmailAndPassword(BuildContext context) async {
    try {

      await signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final json = {'name': _nameController.text, 'lastname': _lastnameController.text, 'sex': _sex.text, 'email': _emailController.text};

      final encoder = JsonUtf8Encoder();
      final encodedString = encoder.convert(json);
      final uint8List = Uint8List.fromList(encodedString);

      await cacheManager.putFile(
        'user_data.json',
        uint8List,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showError(context, 'The email address is already in use by another account.');
      } else if (e.code == 'invalid-email') {
        _showError(context, 'Invalid email address.');
      } else if (e.code == 'weak-password') {
        _showError(context, 'The password provided is too weak.');
      } else {
        _showError(context, 'Error registering user: $e');
      }
    } catch (e) {
      _showError(context, 'Unexpected error: $e');
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Add Scaffold widget
      body: Container(
        color: Colors.green, // Background color of the page
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20), // Add padding
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 50, // Set a fixed height for the input fields
                      child: TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50, // Set a fixed height for the input fields
                      child: TextField(
                        controller: _lastnameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder( 
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),                      
                      value: "Male",
                      items: staticSexValues.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        _sex.text = newValue ?? '';
                      },
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50, // Set a fixed height for the input fields
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50, // Set a fixed height for the input fields
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50, // Set a fixed height for the input fields
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 50, // Set a fixed height for the button
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_validateEmail(_emailController.text) &&
                              _passwordController.text.isNotEmpty &&
                              _passwordController.text == _confirmPasswordController.text) {
                              _registerWithEmailAndPassword(context);
                          } else {
                            _showError(context, 'Invalid input. Please check your email and password.');
                          }
                        },
                        child: Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
