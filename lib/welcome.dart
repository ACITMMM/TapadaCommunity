import 'package:flutter/material.dart';
import 'services_home.dart';

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
                    color: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/welcome.png',
                            width: 350,
                            height: 350,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Text(
                              'Welcome X',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ServicesPage(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
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
                        padding: const EdgeInsets.all(50),
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
            ],
          ),
        ],
      ),
    );
  }
}
