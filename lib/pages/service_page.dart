import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'detail_service_page.dart';

const itemWithGreenAccentColor = <int>[1, 2, 5, 6, 9];

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                children: [
                  _ServiceItemButton(
                    index: 0,
                    title: translate('serviceItems.health'),
                  ),
                  _ServiceItemButton(
                    index: 1,
                    title: translate('serviceItems.socialSecurity'),
                  ),
                  _ServiceItemButton(
                    index: 2,
                    title: translate('serviceItems.nationality'),
                  ),
                  _ServiceItemButton(
                    index: 3,
                    title: translate('serviceItems.initiatives'),
                  ),
                  _ServiceItemButton(
                    index: 4,
                    title: translate('serviceItems.housing'),
                  ),
                  _ServiceItemButton(
                    index: 5,
                    title: translate('serviceItems.finance'),
                  ),
                  _ServiceItemButton(
                    index: 6,
                    title: translate('serviceItems.info'),
                  ),
                  _ServiceItemButton(
                    index: 7,
                    title: translate('serviceItems.trainings'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceItemButton extends StatelessWidget {
  final String title;
  final int index;

  const _ServiceItemButton(
      {Key? key, required this.title, required this.index, j})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailServicePage(
              desc:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies molestie odio, quis facilisis odio lobortis volutpat. Proin faucibus ipsum metus, ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.',
              subTitle: 'Lorem ipsum dolor sit amet',
              title: title,
              isDarkGreen: itemWithGreenAccentColor.contains(index),
            ),
          ),
        );
      },
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
          borderRadius: BorderRadius.circular(32.sp),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
