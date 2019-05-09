import 'package:say_app/screens/widgets/custom_text_field.dart';
import 'package:say_app/services/authentication/authentication.dart';

import '../screens/widgets/circular_button.dart';
import '../screens/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Authentication _auth = Authentication();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _auth.isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: LogoWidget(),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  CustomTextField(
                    handleChange: (String value) {
                      email = value;
                    },
                    hintText: 'EMAIL',
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  CustomTextField(
                    handleChange: (String value) {
                      password = value;
                    },
                    hintText: 'PASSWORD',
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  CircularButton(
                    onPressed: () {
                      print(email + ' ' + password);
                      _auth.createUser(email, password, context);
                    },
                    label: 'REGISTER',
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
    );
  }
}
