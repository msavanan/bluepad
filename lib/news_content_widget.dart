import 'package:bluepad/bottom_scrollbar.dart';
import 'package:bluepad/news_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class NewContentWidget extends StatefulWidget {
  @override
  _NewContentWidgetState createState() => _NewContentWidgetState();
}

class _NewContentWidgetState extends State<NewContentWidget> {
  int likesCount = 46;
  int commentsCount = 4;
  onLikePressed() {
    print('Call From NewsContentWidget');
    print('onLikePressed');
    setState(() {
      likesCount++;
    });
  }

  onCommentPressed() {
    print('Call From NewsContentWidget');
    print('onCommentPressed');
    setState(() {
      commentsCount++;
    });
  }

  onSharePressed() {
    print('Call From NewsContentWidget');
    print('onSharePressed');
  }

  onSavePressed() {
    print('Call From NewsContentWidget');
    print('onSavePressed');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ...buildContent(),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$likesCount Likes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '$commentsCount Comments',
                  style: TextStyle(
                      color: Colors.indigo, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Divider(),
          BottomScrollBar(
              onLikePressed: onLikePressed,
              onCommentPressed: onCommentPressed,
              onSharePressed: onSharePressed,
              onSavePressed: onSavePressed),
          Divider(),
        ]),
      ),
    );
  }
}

List<Widget> buildContent() {
  List<Widget> textList = [];
  for (int i = 0; i < newsContent.length; i++) {
    bool spacing = newsContent[i]['heading'];
    textList.add(Text(
      newsContent[i]['content'],
      style: newsContent[i]['heading'] ? heading : paragraph,
    ));
    if (spacing) {
      textList.add(headingSpace);
    } else {
      textList.add(paragraphSpace);
    }
  }

  textList.add(SizedBox(height: 100));

  return textList;
}
