import 'package:flutter/material.dart';
import 'flow2.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3, // Number of pages (including the ThirdPage)
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 80),
                  color: const Color(0xFF009788), // Background color
                  child: Image.asset(
                    'assets/logo.png', // Replace with your logo image path
                    width: 200, // Adjust width as needed
                    height: 200, // Adjust height as needed
                    fit: BoxFit.contain, // Adjust the fit as needed
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color(
                        0xFF009788), // Background color for the remaining space
                    child: const Center(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed interdum nisl ac justo bibendum luctus. Proin tincidunt, odio ac mattis condimentum, tellus justo vestibulum risus',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (index == 1) {
            return const SecondPage(); // Display the second page
          } else if (index == 2) {
            return const LoginPage();
          }
          return Container(); // Fallback case
        },
        physics: const PageScrollPhysics(), // Allow horizontal swiping
      ),
    );
  }
}
