import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  final int itemIndex;
  final String name;
  final String content;

  @override
  _ContentState createState() => _ContentState();

  Content(this.itemIndex, this.name, this.content);
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Text(
              widget.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
        Expanded(
          flex: 1,
          child: Text(
            widget.content,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
