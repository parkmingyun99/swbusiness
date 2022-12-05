
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var titleList = [
    '질문제목',
    '질문제목',
    '질문제목',
    '질문제목',
    '질문제목',
    '질문제목',
    '질문제목',
    '질문제목',
    '질문제목',
    '질문제목',
  ];
  var imgList = [
    'assets/images/legcurl.jpeg',
    'assets/images/legcurl.jpeg',
    'assets/images/legcurl.jpeg',
    'assets/images/legcurl.jpeg',
    'assets/images/legcurl.jpeg',
    'assets/images/legcurl.jpeg',
    'assets/images/legcurl.jpeg',
    'assets/images/legcurl.jpeg',
    'assets/images/legcurl.jpeg',
    'assets/images/legcurl.jpeg',
  ];
  var description = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  ];

  // popup 띄우기 위한 메서드 구현
  void showPopup(context, title, img, description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 5,
                  color: const Color.fromARGB(255, 255, 200, 0),
                ),
                color: Color.fromARGB(255, 255, 238, 175),
              ),
              child: Column(
                children: [


                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      description,
                      maxLines: 3, // description 데이터가 최대 몇 줄 보여지게 할 지
                      style: const TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 96, 96, 96)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    label: const Text('close'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // 반응형 웹 구현을 위해 MediaQuery class 사용
    // 끝에 숫자는 화면을 차지하는 퍼센트를 의미 : 0.6을 곱하면 화면의 60퍼센트 차지
    double width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 3.0,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index) {
          return GestureDetector( // GestureDetector 대신 InkWell 위젯을 사용해도 됨
            onTap: () {
              // debugPrint(titleList[index]);
              showPopup(context, titleList[index], imgList[index],
                  description[index]);
            },
            child: Card(
              child: Row(
                children: [
                  // 공간의 확보를 위해서는 SizedBox가 Container 보다 효율적임

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text(
                        //   titleList[index],
                        //   style: const TextStyle(
                        //     fontSize: 22,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        SizedBox(
                            width: width,
                            child: Text(
                              titleList[index],
                                style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: width,
                            child: Text(
                              description[index],
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 81, 81, 81),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}