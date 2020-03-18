import 'package:chucknorris/services/api.dart';
import 'package:chucknorris/utils/constants.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Future<List<String>> categories;
  Future<Joke> joke;

  @override
  void initState() {
    super.initState();
    categories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black38,
      ),
      body: FutureBuilder<List<String>>(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].toUpperCase()),
                  onTap: () {
                    Navigator.pushNamed(context, JokesScreen, arguments: snapshot.data[index]);
                  },
                );
              }
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return SizedBox.shrink();
        }),
    );
  }
}
