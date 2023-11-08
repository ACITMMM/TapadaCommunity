import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:tapadacommunity/extensions/build_context_extension.dart';
import 'package:tapadacommunity/services/auth_service.dart';
import 'register.dart';
import 'forgot_password.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_translate/flutter_translate.dart';

import 'welcome.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social Login Buttons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContainer(context));
  }

  final cacheManager = CacheManager(
    Config(
      'register',
      stalePeriod: const Duration(days: 90),
    ),
  );

  bool _validateEmail(String value) {
    // Basic email validation
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(value);
  }

  void _login() async {
    try {
      await AuthService().login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final json = {'email': _emailController.text};

      final encoder = JsonUtf8Encoder();
      final encodedString = encoder.convert(json);
      final uint8List = Uint8List.fromList(encodedString);

      await cacheManager.putFile('user_data.json', uint8List).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomePage()),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _showError('The email address is already in use by another account.');
      } else if (e.code == 'invalid-email') {
        _showError('Invalid email address.');
      } else if (e.code == 'weak-password') {
        _showError('The password provided is too weak.');
      } else {
        _showError('Error registering user: $e');
      }
    } catch (e) {
      _showError('Unexpected error: $e');
    }
  }

  void _registerWithGoogle() async {
    try {
      await AuthService().signInWithGoogle().then((value) {
        debugPrint('exec ${value.user}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomePage()),
        );
      });
    } catch (e) {
      debugPrint('exec $e');
      _showError('Unexpected error: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Center(
          child: SingleChildScrollView(
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    translate('registration.hello'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 24.sp,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(
                        50,
                        50,
                        50,
                        1,
                      ).withOpacity(0.8),
                      border: Border.all(color: Colors.black, width: 2.w),
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: context.screenHeight * .08,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.sp,
                                ),
                                child: TextField(
                                  controller: _emailController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: translate('registration.email'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: context.screenHeight * .08,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.sp,
                                ),
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: translate(
                                      'registration.password',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Container(
                            height: context.screenHeight * .09,
                            padding: EdgeInsets.only(bottom: 10.sp),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_validateEmail(_emailController.text) &&
                                    _passwordController.text.isNotEmpty) {
                                  _login();
                                } else {
                                  _showError(
                                    translate('registration.loginError'),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                translate('registration.continue'),
                              ),
                            ),
                          ),
                          Text(
                            'or',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SocialLoginButton(
                            borderRadius: 20.sp,
                            fontSize: 14.sp,
                            height: context.screenHeight * .08,
                            buttonType: SocialLoginButtonType.facebook,
                            onPressed: () {
                              _showError('Not Implemented yet');
                            },
                          ),
                          const SizedBox(height: 10),
                          SocialLoginButton(
                            borderRadius: 20.sp,
                            fontSize: 14.sp,
                            height: context.screenHeight * .08,
                            buttonType: SocialLoginButtonType.google,
                            onPressed: () {
                              _registerWithGoogle();
                            },
                          ),
                          const SizedBox(height: 10),
                          SocialLoginButton(
                            borderRadius: 20.sp,
                            fontSize: 14.sp,
                            height: context.screenHeight * .08,
                            buttonType: SocialLoginButtonType.apple,
                            onPressed: () {
                              _showError('Not Implemented yet');
                            },
                          ),
                          SizedBox(height: 10.h),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: translate(
                                  'registration.dontHaveLoginYet',
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: translate('registration.register'),
                                    style: const TextStyle(
                                      color: Colors.green,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Add navigation logic to open the registration page here
                                        // For example, you can use Navigator.push() to navigate to the registration page.
                                        // For this example, let's assume there's a RegisterPage widget.
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterPage(),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add navigation logic to open the registration page here
                              // For example, you can use Navigator.push() to navigate to the registration page.
                              // For this example, let's assume there's a RegisterPage widget.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              translate('registration.forgotPassword'),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16.sp,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
