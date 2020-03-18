import 'package:flutter/material.dart';
import 'package:chucknorris/services/api.dart';

class Jokes extends StatefulWidget {
  final String argument;

  Jokes({
    @required this.argument
  });

  @override
  _JokesState createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  Future<Joke> joke;


  Future<Joke> onCallJokes() async {
    return await fetchRandomJoke(widget.argument);
  }

  void _onClickUpdateJoke() {
    onCallJokes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes - ${widget.argument}'),
        backgroundColor: Colors.black38,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _onClickUpdateJoke,
          )
        ],
      ),
      body: FutureBuilder<Joke>(
        future: onCallJokes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.value);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return SizedBox.shrink();
          }),
    );
  }
}