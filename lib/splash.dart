import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'equipa.dart';
import 'services_home.dart';

import 'dart:convert';

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
      stalePeriod: const Duration(days: 90),
    ),
  );

  Future<Map<String, String>?> getUserData() async {
    try {
      final fileInfo = await cacheManager.getFileFromCache('user_data.json');
      if (fileInfo != null) {
        final decodedData = jsonDecode(fileInfo.file.readAsStringSync());
        return Map<String, String>.from(decodedData);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  void _checkEmailCache() async {
    await getUserData().then((value) {
      if (value != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ServicesPage(),
          ),
        );
        return;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EquipaPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/logo.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 16),
          const Text(
            'ACITMMM',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    ]));
  }
}
