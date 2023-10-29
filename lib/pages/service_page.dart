import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/detail_service_model.dart';
import 'detail_service_page.dart';
import 'settings.dart';

const itemWithGreenAccentColor = <int>[1, 2, 5, 6, 9];

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsPage()),
            ),
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    Icon(
                      Icons.account_circle,
                      size: 62.sp,
                      color: Colors.black,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Username',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: EdgeInsets.all(24.sp),
                crossAxisSpacing: 24.sp,
                mainAxisSpacing: 24.sp,
                children: services
                    .asMap()
                    .entries
                    .map(
                      (e) => _ServiceItemButton(
                        index: e.key,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailServicePage(
                                service: e.value,
                                isDarkGreen: itemWithGreenAccentColor.contains(
                                  e.key,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceItemButton extends StatelessWidget {
  final int index;
  final Function()? onTap;

  const _ServiceItemButton({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(12.0, 12.0),
              blurRadius: 12.0,
              color: Colors.black12,
            ),
          ],
          color: (itemWithGreenAccentColor.contains(index))
              ? Colors.green[900]
              : Colors.green,
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Center(
          child: Text(
            services[index].title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
