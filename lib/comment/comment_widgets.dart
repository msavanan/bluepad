import 'package:bluepad/constants.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final String name;
  final String comment;
  final int like;
  CommentWidget(
      {@required this.name, @required this.comment, @required this.like});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: CircleAvatar(
              child: Text(this.name[0]),
              radius: radius,
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.name,
                  style: TextStyle(),
                  //textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                Text(
                  this.comment,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10),
                CommentStat(numLikes: this.like)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentStat extends StatelessWidget {
  final int numLikes;
  CommentStat({@required this.numLikes});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {},
            child: Row(children: [
              Icon(Icons.favorite_border_rounded),
              SizedBox(
                width: 5,
              ),
              Text('${this.numLikes} Like')
            ]),
          ),
        ),
        Flexible(
          child: GestureDetector(
              onTap: () {},
              child: Row(children: [
                Icon(Icons.comment),
                SizedBox(
                  width: 5,
                ),
                Text('Reply ')
              ])),
        ),
        Flexible(child: Text('Mar 23 2021'))
      ],
    );
  }
}
