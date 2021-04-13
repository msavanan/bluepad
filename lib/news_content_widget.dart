import 'dart:ui';

import 'package:bluepad/article_owner.dart';
import 'package:bluepad/bottom_scrollbar.dart';
import 'package:bluepad/comment_field.dart';
import 'package:bluepad/news_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

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
    _getPositions();
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

  _getPositions() {
    final RenderBox renderBoxRed =
        _countWidget.currentContext.findRenderObject();
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);

    final RenderBox newsbox = _newskey.currentContext.findRenderObject();
    print('News article size = ${newsbox.size}');

    print(renderBoxRed.size.height);
    newsContentScroller.addListener(() {
      final RenderBox newsbox = _newskey.currentContext.findRenderObject();
      print('News article size = ${newsbox.size}');
      if (newsContentScroller.position.pixels >=
          (newsbox.size.height - MediaQuery.of(context).size.height)) {
        //print(newsContentScroller.position.pixels);
        //print(newsbox.size.height - MediaQuery.of(context).size.height);
        setState(() {
          bottomBar = false;
        });
      } else {
        setState(() {
          bottomBar = true;
        });
      }

      // Do nothing now
    });

    //var t = PointTransformer(positionRed);
    //print("POSITION of Count widget: ${positionRed.dy} ");
    //print('position of scroll Controller: ${newsContentScroller.position}.');
    //print('Device Pixel ratio: ${renderBoxRed.size}');
  }

  @override
  void dispose() {
    newsContentScroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    newsContentScroller.addListener(() {
      final RenderBox newsbox = _newskey.currentContext.findRenderObject();
      print('News article size = ${newsbox.size}');
      if (newsContentScroller.position.pixels >=
          (newsbox.size.height - MediaQuery.of(context).size.height + 80)) {
        //print(newsContentScroller.position.pixels);
        //print(newsbox.size.height - MediaQuery.of(context).size.height);
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

        /*showBottomSheet(
            context: context,
            builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Center(child: Text('Reached bottom of the page')),
                ));*/
      } else {
        setState(() {
          bottomPage = false;
        });
      }
    });

    //_getPositions();
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
                  Divider(
                    key: _countWidget,
                  ),
                  Container(
                    //key: _countWidget,
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
