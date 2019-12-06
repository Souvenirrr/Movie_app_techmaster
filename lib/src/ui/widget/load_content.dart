import 'package:flutter/material.dart';

class LoadContent extends StatefulWidget {
  @override
  _LoadContentState createState() => _LoadContentState();
}

class _LoadContentState extends State<LoadContent> {
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
