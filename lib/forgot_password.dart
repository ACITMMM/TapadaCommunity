import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  bool _validateEmail(String value) {
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 50,
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
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_validateEmail(_emailController.text)) {
                            // Send reset password email logic here
                          } else {
                            // Show an error message or perform other actions for invalid input
                          }
                        },
                        child: Text('Reset Password'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
