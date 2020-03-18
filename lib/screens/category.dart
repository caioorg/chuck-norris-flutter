import 'package:chucknorris/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(title: 'Counter Person', home: Category()));
}

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Category'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Category'),
            RaisedButton(
              child: Text('Go to Seconde'),
              onPressed: () {
                Navigator.pushNamed(context, JokesScreen, arguments: 'funcionou');
              },
            )
          ],
        ),
      ),
    );
  }
}
