import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tapadacommunity/pages/info_page.dart';
import 'package:tapadacommunity/pages/service_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ValueNotifier<int> _selectedBottomIndex;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedBottomIndex = ValueNotifier(0);
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _selectedBottomIndex.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              _selectedBottomIndex.value = page;
            },
            children: const [
              ServicePage(),
              SizedBox(child: Center(child: Text('No design yet'))),
              InfoPage(),
              SizedBox(child: Center(child: Text('No design yet'))),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.green[900],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.sp,
              vertical: 6.sp,
            ),
            child: ValueListenableBuilder<int>(
              valueListenable: _selectedBottomIndex,
              builder: (_, selectedIndex, __) {
                double generateSize(int i) {
                  return (selectedIndex == i) ? 28.sp : 20.sp;
                }

                Color generateColor(int i) {
                  return (selectedIndex == i) ? Colors.white : Colors.green;
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _selectedBottomIndex.value = 0;
                        _pageController.jumpToPage(0);
                      },
                      icon: Icon(
                        Icons.home,
                        color: generateColor(0),
                        size: generateSize(0),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _selectedBottomIndex.value = 1;
                        _pageController.jumpToPage(1);
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: generateColor(1),
                        size: generateSize(1),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _selectedBottomIndex.value = 2;
                        _pageController.jumpToPage(2);
                      },
                      icon: Icon(
                        Icons.info,
                        color: generateColor(2),
                        size: generateSize(2),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _selectedBottomIndex.value = 3;
                        _pageController.jumpToPage(3);
                      },
                      icon: Icon(
                        Icons.phone,
                        color: generateColor(3),
                        size: generateSize(3),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
