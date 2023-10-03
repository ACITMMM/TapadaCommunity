import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:tapadacommunity/auth.dart';
import 'package:tapadacommunity/welcome.dart';
import 'register.dart';
import 'forgot_password.dart';


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
      body: _buildContainer(context)
    );
  }

  void _registerWithGoogle(BuildContext context) async {
    try {

      await signInWithGoogle();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );

    } catch (e) {
      _showError(context, 'Unexpected error: $e');
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 5),
      ),
    );
  }



Widget _buildContainer(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/login_background.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            widthFactor: 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Hello',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black, // Text color
                    fontSize: 24,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(50, 50, 50, 1).withOpacity(0.8),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0, // Frame width
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            hintText: '    E-mail',
                            filled: true, // Set the field to be filled
                            fillColor: Colors.white, // Set the fill color to white                        
                            border: OutlineInputBorder( // Add border to the text input
                              borderRadius: BorderRadius.circular(20.0),
                            ),    
                            contentPadding: EdgeInsets.symmetric(vertical: 12), // Adjust the vertical padding
                          ),                      
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 60, // Set a fixed height for the button
                          padding: EdgeInsets.only(bottom: 10), // Add bottom padding
                          child: ElevatedButton(
                            onPressed: () {
                              // Add submission logic here
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green, // Set the button color to green
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),                          
                            ),
                            child: Text('Continue'),
                          ),
                        ),
                        Text(
                          'or',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 20,
                          ),
                        ),                    
                        const SizedBox(height: 10),
                        SocialLoginButton(
                          borderRadius: 20,
                          buttonType: SocialLoginButtonType.facebook,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        SocialLoginButton(
                          borderRadius: 20,
                          buttonType: SocialLoginButtonType.google,
                          onPressed: () {
                            _registerWithGoogle(context);
                          },
                        ),
                        const SizedBox(height: 10),
                        SocialLoginButton(
                          buttonType: SocialLoginButtonType.apple,
                          borderRadius: 20,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        SocialLoginButton(
                          buttonType: SocialLoginButtonType.microsoft,
                          borderRadius: 20,
                          onPressed: () {},
                          imageWidth: 20,
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'Don\'t have a login yet? ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Register',
                                  style: TextStyle(
                                    color: Colors.green, // Change the color to indicate it's a link
                                    decoration: TextDecoration.underline, // Add underline to indicate it's a link
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Add navigation logic to open the registration page here
                                      // For example, you can use Navigator.push() to navigate to the registration page.
                                      // For this example, let's assume there's a RegisterPage widget.
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => RegisterPage()),
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
                              MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                            );
                          },
                          child: Text(
                            'Don\'t have a login yet? Register',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue, // Change the color to indicate it's a link
                              fontSize: 16,
                              decoration: TextDecoration.underline, // Add underline to indicate it's a link
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
