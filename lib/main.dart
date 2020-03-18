import 'package:chucknorris/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:chucknorris/screens/not-found.dart';
import 'router.dart' as router;

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute: CategoryScreen,
      onGenerateRoute: router.generateRouter,
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => NotFound(name: settings.name)),
    );
  }
}
