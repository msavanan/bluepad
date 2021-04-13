import 'package:bluepad/comment_widgets.dart';
import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommentWidget(
          name: 'Anu Jadhav',
          comment: 'Appreciate your work keep writing',
          like: 0,
        ),
        Divider(),
        CommentWidget(
            name: 'Kiran Bhosale',
            comment:
                'Art is the primary purpose of life. Everything else is there to support it',
            like: 1)
      ],
    );
  }
}
