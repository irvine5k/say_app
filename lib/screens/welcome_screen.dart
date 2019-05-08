import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/widgets/circular_button.dart';
import '../screens/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LogoWidget(),
            SizedBox(
              height: 48.0,
            ),
            CircularButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              label: 'LOGIN',
              color: Colors.blue,
            ),
            CircularButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              label: 'REGISTER',
            ),
          ],
        ),
      ),
    );
  }
}
