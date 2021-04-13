import 'package:bluepad/news_content_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BluePad());
}

class BluePad extends StatelessWidget {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      theme: ThemeData(
        primaryColor: Colors.white,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.black,
            side: BorderSide(color: Colors.black, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bluepad',
            style: TextStyle(color: Colors.indigo, fontSize: 22),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _messengerKey.currentState
                  .showSnackBar(SnackBar(content: Text('Home button pressed')));
            },
          ),
        ),
        body: NewsContentWidget(),
      ),
    );
  }
}
