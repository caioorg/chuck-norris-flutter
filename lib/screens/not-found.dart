import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  final String name;
  const NotFound({ Key key, this.name}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: (Text('Error Page')),
    ),
    );
  }
}
