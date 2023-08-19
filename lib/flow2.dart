import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social Login Buttons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(tittle: 'Flutter Social Login Buttons'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.tittle}) : super(key: key);
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContainer(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialLoginButton(
                borderRadius: 20,
                buttonType: SocialLoginButtonType.facebook,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                borderRadius: 20,
                buttonType: SocialLoginButtonType.google,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.appleBlack,
                borderRadius: 20,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.microsoftBlack,
                borderRadius: 20,
                onPressed: () {},
                imageWidth: 20,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
