import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Color color;
  final String label;
  final Function onPressed;

  const CircularButton({Key key, this.label, this.onPressed, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          color: color == null ? Colors.blue[800] : color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              label,
            ),
          ),
        ),
      ),
    );
  }
}
