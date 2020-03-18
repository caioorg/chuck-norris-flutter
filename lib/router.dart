import 'package:chucknorris/screens/category.dart';
import 'package:chucknorris/screens/jokes.dart';
import 'package:chucknorris/screens/not-found.dart';
import 'package:chucknorris/utils/constants.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRouter(RouteSettings settings) {
  switch (settings.name) {
    case CategoryScreen:
      return MaterialPageRoute(builder: (context) => Category());
    case JokesScreen:
      var arguments = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => Jokes(argument: arguments));
    default:
      return MaterialPageRoute(
          builder: (context) => NotFound(name: settings.name));
  }
}
