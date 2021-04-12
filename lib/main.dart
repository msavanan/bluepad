import 'package:bluepad/news_content_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BluePad());
}

class BluePad extends StatelessWidget {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      theme: ThemeData(
        primaryColor: Colors.white,
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
              _messangerKey.currentState
                  .showSnackBar(SnackBar(content: Text('Home button pressed')));
            },
          ),
        ),
        body: NewContentWidget(),
      ),
    );
  }
}
