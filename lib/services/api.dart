import 'dart:convert';

import 'package:http/http.dart' as http;

class Joke {
  final String id;
  final String value;
  final String url;
  final String iconUrl;

  Joke({this.id, this.value, this.url, this.iconUrl});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'],
      value: json['value'],
      url: json['url'],
      iconUrl: json['icon_url'],
    );
  }
}

Future<Joke> fetchRandomJoke(category) async {
  final response = await http.get("https://api.chucknorris.io/jokes/random?category=$category");

  if (response.statusCode == 200) {
    return Joke.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load a joke");
  }
}

Future<List<String>> fetchCategories() async {
  final response =
  await http.get("https://api.chucknorris.io/jokes/categories");

  if (response.statusCode == 200) {
    var res = List<String>();

    (json.decode(response.body) as List).forEach((f) {
      res.add(f.toString());
    });

    return res;
  } else {
    throw Exception("Failed to load categories");
  }
}