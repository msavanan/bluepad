import 'package:bluepad/author/author.dart';
import 'package:bluepad/constants.dart';
import 'package:flutter/material.dart';

class ArticleOwner extends StatelessWidget {
  final Author author = Author();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          creator(author.imagePath),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                side: BorderSide(color: Colors.black, width: 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
              ),
              onPressed: () {},
              child: Text('Follow')),
        ],
      ),
    );
  }
}

Row creator(String imagePath) {
  final Author author = Author();
  Widget avatar;
  if (imagePath != null) {
    avatar = CircleAvatar(
      backgroundImage: ExactAssetImage(
        imagePath,
      ),
      radius: radius,
    );
  } else {
    avatar = CircleAvatar(
      child: Text('A'),
      radius: radius,
    );
  }

  return Row(children: [
    avatar,
    SizedBox(width: 10),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          author.name,
          style: TextStyle(),
          //textAlign: TextAlign.start,
        ),
        Text(
          'Mar 23, 2021',
          style: TextStyle(color: Colors.grey),
        )
      ],
    ),
  ]);
}
