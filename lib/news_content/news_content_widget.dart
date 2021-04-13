import 'dart:ui';

import 'package:bluepad/author/article_owner.dart';
import 'package:bluepad/author/author.dart';
import 'package:bluepad/widgets/bottom_scrollbar.dart';
import 'package:bluepad/comment/commentList.dart';
import 'package:bluepad/comment/comment_field.dart';
import 'package:bluepad/news_content/news_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class NewsContentWidget extends StatefulWidget {
  @override
  _NewsContentWidgetState createState() => _NewsContentWidgetState();
}

class _NewsContentWidgetState extends State<NewsContentWidget> {
  int likesCount = 46;
  int commentsCount = 4;

  GlobalKey _countWidget = GlobalKey();
  GlobalKey _newskey = GlobalKey();
  ScrollController newsContentScroller = ScrollController();

  bool bottomBar = true;
  bool bottomPage = false;

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
  void dispose() {
    newsContentScroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    newsContentScroller.addListener(() {
      final RenderBox newsBox = _newskey.currentContext.findRenderObject();
      final RenderBox bottomBarBox =
          _countWidget.currentContext.findRenderObject();

      if (newsContentScroller.position.pixels >=
          (newsBox.size.height -
              MediaQuery.of(context).size.height +
              bottomBarBox.size.height +
              paddingSpace)) {
        setState(() {
          bottomBar = false;
        });
      } else {
        setState(() {
          bottomBar = true;
        });
      }

      if (newsContentScroller.offset >=
              newsContentScroller.position.maxScrollExtent &&
          !newsContentScroller.position.outOfRange) {
        setState(() {
          bottomPage = true;
        });
      } else {
        setState(() {
          bottomPage = false;
        });
      }
    });
    return Stack(children: [
      SingleChildScrollView(
        controller: newsContentScroller,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Column(
                key: _newskey,
                children: [
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
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    key: _countWidget,
                    child: BottomScrollBar(
                        onLikePressed: onLikePressed,
                        onCommentPressed: onCommentPressed,
                        onSharePressed: onSharePressed,
                        onSavePressed: onSavePressed),
                  ),
                ],
              ),
              Divider(),
              ArticleOwner(),
              Divider(),
              CommentField(),
              Divider(),
              CommentList(),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
      bottomBar
          ? Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 90,
                child: BottomScrollBar(
                    onLikePressed: onLikePressed,
                    onCommentPressed: onCommentPressed,
                    onSharePressed: onSharePressed,
                    onSavePressed: onSavePressed),
              ),
            )
          : Container(),
      bottomPage
          ? Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(child: Text('Reached bottom of the page')),
              ))
          : Container(),
    ]);
  }
}

List<Widget> buildContent() {
  List<Widget> textList = [];
  final Author newAuthor = Author();

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

  Widget author = creator(newAuthor.imagePath);

  textList.insert(2, author);
  textList.insert(3, headingSpace);

  return textList;
}
