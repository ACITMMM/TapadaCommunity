import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'equipa.dart';
import 'services_home.dart';

import 'dart:convert';
import 'dart:typed_data'; 

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

  final cacheManager = CacheManager(
    Config(
      'register',
      stalePeriod: Duration(days: 90),
    ),
  );

  Future<Map<String, String>?> getUserData() async {
    try {
      final fileInfo = await cacheManager.getFileFromCache('user_data.json');
      if ( fileInfo != null) {
        const JsonDecoder decoder = JsonDecoder();
        final decodedData = jsonDecode(fileInfo.file.readAsStringSync());
        return Map<String, String>.from(decodedData);
      }
      else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  void _checkEmailCache() async {
    final userData = await getUserData();
    if (userData != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ServicesPage(),
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


