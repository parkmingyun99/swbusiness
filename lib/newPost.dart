import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkmingyun/post.dart';
import 'package:parkmingyun/postPage.dart';
import 'package:parkmingyun/provider/userProvider.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class newPost extends StatefulWidget {
  const newPost({Key? key}) : super(key: key);

  @override
  State<newPost> createState() => _newPost();
}

class _newPost extends State<newPost> {

  late UserProvider _userProvider;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  Post post = Post(); //Post 클래스의 인스턴스 생성
  int participantsCounter = 0;

  String? yearMonthDay; // 사용자가 입력한 날짜를 저장하기 위한 변수
  String? meetingTime; // 사용자가 입력한 시각을 저장하기 위한 변수

  void _tryValidation() {
    //validation이 유효한지
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }




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
                    Text("해당 게시글을 등록하시겠습니까?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 110,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                _tryValidation();
                                try {
                                  if (post.content != null &&
                                      post.title != null) {
                                    await FirebaseFirestore.instance
                                        .collection("Post")
                                        .add({
                                      "Uid": _userProvider.uid,
                                      "WriterName": _userProvider.nickname,
                                      "Content": post.content!,
                                      // "Date": post.date!,
                                      // "UpperCategory": post.upperCategory!,
                                      // "LowerCategory": post.lowerCategory!,
                                      // "maxParticipants": post.maxParticipants!,
                                      "Title": post.title!,
                                    });

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return postPage();
                                      }),
                                    );
                                  } else {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('모든 값이 입력되어야 합니다!'),
                                        backgroundColor: Colors.blue,
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              icon: const Icon(Icons.circle_outlined),
                              label: const Text('네'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                                onPrimary: Colors.white, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 110,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                              label: const Text('아니요'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ), // Background color
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              '글쓰기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            centerTitle: true,
            elevation: 3.0,
            backgroundColor: Colors.redAccent, //뒤로가기 버튼 삭제
          ),
          body: ListView(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 0.0),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '제목',
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: TextFormField(
                                    key: ValueKey(1),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '제목을 입력해주세요!';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      hintText: '제목을 입력해주세요.',
                                    ),
                                    onChanged: (text) {
                                      post.title = text;
                                    },
                                    onSaved: (text) {
                                      post.title = text;
                                    },
                                    autofocus: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),

                                // 내용 //
                                const Text(
                                  '내용',
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 10 * 24.0,
                                  padding: const EdgeInsets.only(right: 15),
                                  child: TextFormField(
                                    key: ValueKey(2),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '내용을 입력해주세요!';
                                      } else {
                                        return null;
                                      }
                                    },
                                    maxLines: 10,
                                    decoration: const InputDecoration(
                                        hintText: '내용을 입력해주세요.',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        )),
                                    onChanged: (text) {
                                      post.content = text;
                                    },
                                    onSaved: (text) {
                                      post.content = text;
                                    },
                                    autofocus: true,
                                  ),
                                ),
                              ]),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const HomeScreen()),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                child: const Text(
                                  '취소하기',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 50.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: OutlinedButton(
                                onPressed: () {
                                  showPopup(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                child: const Text(
                                  '작성하기',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ])),
    );
  }
}
