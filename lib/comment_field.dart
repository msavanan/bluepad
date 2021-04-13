import 'package:bluepad/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CircleAvatar(
              radius: radius,
              child: Text('D'),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 4,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Write a Comment',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              )),
        ],
      ),
    );
  }
}
