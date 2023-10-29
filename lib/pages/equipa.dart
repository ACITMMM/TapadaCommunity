import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:tapadacommunity/pages/splash.dart';
import 'intro.dart';
import 'intro_second.dart';

class EquipaPage extends StatefulWidget {
  final bool startSpalsh;

  const EquipaPage({Key? key, required this.startSpalsh}) : super(key: key);

  @override
  State<EquipaPage> createState() => _EquipaPageState();
}

class _EquipaPageState extends State<EquipaPage> {
  int currentIndex = 0;
  late final ValueNotifier<bool> _showSplash;

  @override
  void initState() {
    super.initState();
    _delay();
    _showSplash = ValueNotifier(widget.startSpalsh);
  }

  @override
  void dispose() {
    _showSplash.dispose();
    super.dispose();
  }

  Future<void> _delay() async {
    await Future.delayed(const Duration(seconds: 2), () {
      _showSplash.value = false;
    });
  }

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
                            'assets/equipa.png',
                            width: 350,
                            height: 350,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                              textAlign: TextAlign.center,
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
              const IntroPage(),
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
                  size: const Size.square(12.0),
                  activeSize: const Size(12.0, 12.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _showSplash,
            builder: (_, showSplash, __) {
              if (showSplash) const SplashScreen();
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
