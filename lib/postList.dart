import 'package:flutter/material.dart';
import 'package:parkmingyun/config/palette.dart';

class PostList extends StatelessWidget {
  const PostList(
      this.content,
      this.title,
      this.writerName,
      {Key? key})
      : super(key: key);

  final String content;
  final String title;
  final String writerName;

  // String curState() {
  //   if (maxParticipants > curParticipants) {
  //     return "모집중";
  //   } else {
  //     return "모집완료";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          padding: EdgeInsets.fromLTRB(18, 10, 10, 7),
          height: MediaQuery.of(context).size.width * 0.23,
          width: MediaQuery.of(context).size.width * 0.98,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Palette.lightgrey,
                borderRadius: BorderRadius.circular(7.0)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 22, right: 5, top: 5),
          child: Text(
            "작성자: $writerName",
            style: TextStyle(fontSize: 13, color: Colors.black, height: 1.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            height: 1.0,
            width: 500.0,
          ),
        ),
      ],
    );
  }
}
