import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isCurrentUser;

  const MessageBubble({Key key, this.text, this.sender, this.isCurrentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$sender',
            style: TextStyle(color: Colors.blueGrey),
          ),
          SizedBox(height: 2),
          Material(
            elevation: 3,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topLeft: isCurrentUser ? Radius.circular(20.0) : Radius.zero,
                topRight: isCurrentUser ? Radius.zero : Radius.circular(20.0)),
            color: isCurrentUser ? Colors.blue : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                '$text',
                style: TextStyle(
                    color: isCurrentUser ? Colors.white : Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
