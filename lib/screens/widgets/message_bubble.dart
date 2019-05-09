import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;

  const MessageBubble({Key key, this.text, this.sender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: ListTile(
        title: Text(
          '$sender',
          style: TextStyle(color: Colors.blue),
        ),
        subtitle: Text(
          '$text',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
