import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      accentColor: Colors.teal.shade400,
      appBarTheme: AppBarTheme(
        color: Colors.blue,
      ),
    ),
    home: App(),
  ),
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Magic 8 Ball'),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int answer = 1;
  bool loading = false;

  void getAnswer() {
    setState(() {
      loading = true;

      new Timer(Duration(seconds: 1), setAnswer);
    });
  }

  void setAnswer() {
    setState(() {
      loading = false;
      answer = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('images/ball$answer.png'),
            Container(
              child: !loading ? (
                RaisedButton(
                  onPressed: getAnswer,
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  child: Text('GET AN ANSWER'),
                )
              ) : (
                Text('Wait please... I am thinking!')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
