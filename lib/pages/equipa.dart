import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tapadacommunity/extensions/build_context_extension.dart';
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
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          PageView(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: context.screenHeight * .02),
                      Image.asset(
                        'assets/logo.png',
                        width: context.screenWidth * .3,
                        fit: BoxFit.fitWidth,
                      ),
                      Image.asset(
                        'assets/equipa.png',
                        width: context.screenWidth * .5,
                        fit: BoxFit.fitWidth,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: context.screenHeight * .08),
                    ],
                  ),
                ),
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
        ],
      ),
    );
  }
}
