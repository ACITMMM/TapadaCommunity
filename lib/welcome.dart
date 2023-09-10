

import 'package:flutter/material.dart';
import 'intro.dart';
import 'intro_second.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Stack(
                children: [
                  Container(
                    color: Colors.green, // Set the background color to green
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/welcome.png', // Use the transparent logo image
                              width: 350, // Adjust width as needed
                              height: 350, // Adjust height as needed
                              fit: BoxFit.contain, // Adjust the fit as needed
                            ),
                          ),
                          const SizedBox(height: 16), // Add spacing
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16), // Add padding of 16 units on left and right
                            child: Text(
                              'Bem vindo',
                              style: TextStyle(
                                fontSize: 16, // Adjust the font size as needed
                                color: Colors.white,
                                decoration: TextDecoration.none, // Remove underline
                              ),
                              textAlign: TextAlign.center, // Center the text
                            ),
                          )                        
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(50), // Add 40 units of padding
                        child: Image.asset(
                          'assets/logo.png', // Add your logo image
                          width: 100, // Adjust width as needed
                          height: 100, // Adjust height as needed
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
