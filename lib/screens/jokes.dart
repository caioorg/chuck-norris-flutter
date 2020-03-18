import 'package:flutter/material.dart';
import 'package:chucknorris/services/api.dart';

class Jokes extends StatefulWidget {
  final String argument;

  Jokes({@required this.argument});

  @override
  _JokesState createState() => _JokesState();
}

class _JokesState extends State<Jokes> {
  Future<Joke> joke;


  Future<Joke> onCallJokes() async {
    var result = await fetchRandomJoke(widget.argument);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes - ${widget.argument}'),
        backgroundColor: Colors.black38,
      ),
      body: FutureBuilder<Joke>(
          future: onCallJokes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        snapshot.data.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return SizedBox.shrink();
          }),
    );
  }
}
