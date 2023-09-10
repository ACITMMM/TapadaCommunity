import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'equipa.dart';
import 'welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Delay the splash screen for 3 seconds.
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the home screen after the splash screen.
      _checkEmailCache();
    });
  }

  void _checkEmailCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedEmail = prefs.getString('cachedEmail');
    if (cachedEmail != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => WelcomePage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EquipaPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home.png'), // Background image
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
          ),   
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [            
                Image.asset(
                  'assets/logo.png', // Path to your logo image
                  width: 150, // Adjust the width as needed
                  height: 150, // Adjust the height as needed
                ),
                const SizedBox(height: 16), // Add spacing
                Text(
                  'ACITMMM',
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size as needed
                    fontWeight: FontWeight.bold, // Adjust the font weight as needed
                    color: Colors.white,
                  ),
                ),
              ]
            ),
          ),
        ]        
      )
    );
  }
}


