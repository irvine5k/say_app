import '../screens/widgets/circular_button.dart';
import '../screens/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Widget _textField(Function onChanged(String value), String hintText) {
      return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black54),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                alignment: Alignment.center,
                child: LogoWidget(),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            _textField((String value) {}, 'EMAIL'),
            SizedBox(
              height: 8.0,
            ),
            _textField((String value) {}, 'PASSWORD'),
             SizedBox(
              height: 8.0,
            ),
            _textField((String value) {}, 'CONFIRM PASSWORD'),
            SizedBox(
              height: 24.0,
            ),
            CircularButton(
              onPressed: () {},
              label: 'LOGIN',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
