import 'package:flutter/material.dart';

class BottomScrollBar extends StatelessWidget {
  BottomScrollBar(
      {@required this.onLikePressed,
      @required this.onCommentPressed,
      @required this.onSharePressed,
      @required this.onSavePressed});
  final Function onLikePressed;
  final Function onCommentPressed;
  final Function onSharePressed;
  final Function onSavePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomBarItem(
              icons: Icons.thumb_up,
              onIconPressed: onLikePressed,
              label: 'Like'),
          BottomBarItem(
              icons: Icons.comment,
              onIconPressed: onCommentPressed,
              label: 'Comment'),
          BottomBarItem(
              icons: Icons.share,
              onIconPressed: onSharePressed,
              label: 'Share'),
          BottomBarItem(
              icons: Icons.arrow_downward,
              onIconPressed: onSavePressed,
              label: 'Save')
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  BottomBarItem({
    @required this.icons,
    @required this.onIconPressed,
    @required this.label,
  });
  final IconData icons;
  final String label;
  final Function onIconPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [Icon(icons), Text(label)],
      ),
      onTap: onIconPressed,
    );
  }
}
