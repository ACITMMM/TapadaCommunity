import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'intro.dart';
import 'intro_second.dart';

class EquipaPage extends StatefulWidget {
  const EquipaPage({Key? key}) : super(key: key);

  @override
  State<EquipaPage> createState() => _EquipaPageState();
}

class _EquipaPageState extends State<EquipaPage> {
  int currentIndex = 0;

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
                              'assets/equipa.png', // Use the transparent logo image
                              width: 350, // Adjust width as needed
                              height: 350, // Adjust height as needed
                              fit: BoxFit.contain, // Adjust the fit as needed
                            ),
                          ),
                          const SizedBox(height: 16), // Add spacing
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16), // Add padding of 16 units on left and right
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
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
              const IntroPage(), // Display the second page
              const IntroSecondPage(),
            ],
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: DotsIndicator(
                dotsCount: 3,
                position: currentIndex,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
