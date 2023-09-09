import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _validateEmail(String value) {
    // Basic email validation
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(value);
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
                            // Registration logic here
                            // Navigate to the next page or perform necessary actions
                          } else {
                            // Show an error message or perform other actions for invalid input
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
