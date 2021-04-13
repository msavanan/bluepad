import 'package:flutter/material.dart';

class ArticleOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            child: Text('A'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amruta Subhekar',
                style: TextStyle(),
                //textAlign: TextAlign.start,
              ),
              Text(
                'Mar 23, 2021',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
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
