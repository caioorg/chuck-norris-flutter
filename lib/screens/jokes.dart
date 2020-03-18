import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Counter Person', home: Jokes()));
}

class Jokes extends StatelessWidget {
  final String argument;

  const Jokes({ Key key, this.argument }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes')
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Jokes'),
            Text('Argument $argument')
          ],
        ),
      ),
    );
  }
}
