import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late final ValueNotifier<bool> _isExpand;

  @override
  void initState() {
    super.initState();
    _isExpand = ValueNotifier(false);
  }

  @override
  void dispose() {
    _isExpand.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/info-placeholder.jpeg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ColoredBox(
              color: Colors.green[900]!.withOpacity(.9),
              child: ValueListenableBuilder<bool>(
                valueListenable: _isExpand,
                builder: (_, isExpand, __) => AnimatedContainer(
                  duration: duration,
                  height: isExpand
                      ? MediaQuery.of(context).size.height * .7
                      : MediaQuery.of(context).size.height * .4,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 32.h),
                          Text(
                            'Historia',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non tortor est. Nulla feugiat nibh odio, sit amet fermentum nisl dictum vitae. Cras ultricies venenatis mi sit amet fermentum. Suspendisse potenti. Integer ligula nisi, molestie quis pretium sed, porttitor ac lacus. Pellentesque sit amet urna diam. Integer ultricies ${isExpand ? 'ut condimentum sapien laoreet ac. Praesent ligula augue, volutpat ut ultrices id, venenatis ac tortor. Donec ornare ac turpis nec efficitur. Aenean accumsan ex eu ex laoreet, faucibus posuere lorem tempor. Duis in purus sed sapien venenatis rhoncus sed condimentum felis. Nullam scelerisque augue non ante varius, sit amet aliquet dolor gravida. Sed ullamcorper non diam eu hendrerit.' : ''}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isExpand,
                            builder: (_, isExpand, __) {
                              if (isExpand) {
                                return const SizedBox.shrink();
                              }
                              return Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    _isExpand.value = !_isExpand.value;
                                  },
                                  child: const Text(
                                    'Ver Mais',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _isExpand,
            builder: (_, isExpand, __) => AnimatedPositioned(
              duration: duration,
              bottom:
                  isExpand ? 70.h : MediaQuery.of(context).size.height * .36,
              right: 12.0,
              child: ValueListenableBuilder<bool>(
                valueListenable: _isExpand,
                builder: (_, isExpand, __) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: const Text(
                              'Religiao e cultura islamica',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.sp),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                          child: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: const Text(
                              'Tapada das Merces',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _isExpand,
            builder: (_, isExpand, __) => Positioned(
              right: 0.0,
              left: 0.0,
              bottom: MediaQuery.of(context).size.height * .68,
              child: AnimatedOpacity(
                duration: duration,
                opacity: isExpand ? 1.0 : 0.0,
                child: IconButton(
                  onPressed: () => _isExpand.value = false,
                  icon: Icon(
                    Icons.arrow_drop_down_circle_rounded,
                    size: 42.sp,
                    color: Colors.white,
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
