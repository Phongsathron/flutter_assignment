import 'package:flutter/material.dart';
import 'pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/second': (context) => FirstScreen()
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("First Page"),
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Text("Test"),
              RaisedButton(
                child: Text("Next"),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              ),
            ],
          ),
        ));
  }
}

