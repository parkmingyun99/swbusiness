import 'package:flutter/material.dart';
import 'package:parkmingyun/config/palette.dart';
import 'package:parkmingyun/post.dart';

class postDetailPage extends StatefulWidget {
  final Post post;

  const postDetailPage(this.post, {super.key});

  @override
  State<postDetailPage> createState() => _postDetailPage();
}

class _postDetailPage extends State<postDetailPage> {

  void showPopup(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("이 공동구매에 참여하시겠습니까?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center),

                  ],
                )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '자유게시판',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        elevation: 3.0,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 10, 5),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.08,
              width: MediaQuery.of(context).size.width * 0.15,
              child: DecoratedBox(
                decoration: BoxDecoration(

                    color: Palette.lightgrey,
                    borderRadius: BorderRadius.circular(10.0)),
                child : Text(
                    widget.post.title.toString(),
                    style: TextStyle(
                      fontSize: 14,
                    ),),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 20, 5),
            child: Row(
              children: [

              ],
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

          Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    padding: EdgeInsets.fromLTRB(0, 18, 0, 7),
                    width: MediaQuery.of(context).size.width * 0.98,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Palette
                                  .grey, //                   <--- border width here
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            //color: Palette.lightgrey,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(13, 15, 13, 15),
                            child: Text(
                              widget.post.content.toString(),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.redAccent,
                      Colors.redAccent,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.90,
                child: OutlinedButton(
                  onPressed: () {
                    showPopup(context);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23.0),
                    ),
                  ),
                  child: const Text(
                    '좋아요',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
