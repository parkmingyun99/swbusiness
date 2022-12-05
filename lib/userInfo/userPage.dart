import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkmingyun/eventCalander.dart';
import 'package:parkmingyun/home.dart';
import 'package:parkmingyun/screens/MyPostScreen.dart';
import 'package:provider/provider.dart';

import '../provider/userProvider.dart';
import '../screens/changedMyBody.dart';
import '../screens/faq.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPage createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  final List<Category> catego = [
    Category(
      imagUrl: "assets/images/alexsandra.png",
      name: "데드리프트",
    ),
    Category(
      imagUrl: "assets/images/sule.png",
      name: "랫풀다운",
    ),
    Category(
      imagUrl: "assets/images/frontsquat.jpeg",
      name: "스쿼트",
    ),
    Category(
      imagUrl: "assets/images/legcurl.jpeg",
      name: "레그컬",
    ),
  ];
  late UserProvider _userProvider;
  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    String str = _userProvider.email.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 정보',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        elevation: 3.0,
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),

      body :
      Column(
        children: [

          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Container(
                // height: 120,
                // width: 500,
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Padding(padding: EdgeInsets.only(left: 10,)),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person_outline,
                        size: 35,
                        color: Colors.black12,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_userProvider.nickname + ' 님',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('( '+str+' )'),
                        SizedBox(height: 20),
                      ],
                    )
                  ],
                ),
              ),
            ),


            flex: 1, //총 flex 합에서 1만큼의 비율을 가져간다.
          ),


          // 2번째 박스!
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Container(
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('  나의 활동',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.post_add),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyPostScreen()),
                            );
                          },
                          child: Text(' 내가 쓴 게시글 ',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.signal_cellular_alt_outlined),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyBody()),
                            );
                          },
                          child: Text(' 나의 변화보기 ',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.calendar_month_outlined),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TableEventsExample()),
                            );
                          },
                          child: Text(' 나의 운동기록 ',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 3번째 박스!!
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Container(
                height: 100,
                width: 500,
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('  기타',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.search_rounded),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListViewPage()),
                            );
                          },
                          child: Text(' 자주 묻는 질문 ',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('   오늘의 추천 운동',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          //
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  width: double.infinity,
                  // height: 200,
                  child: ListView.builder(
                      itemCount: catego.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  //
                                  // height: 50,
                                  width: 130,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(catego[index].imagUrl),
                                      fit: BoxFit.cover,

                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child:
                                Text(
                                  catego[index].name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              )), //
        ],
      ),
    );
  }
}

class Category {
  final String imagUrl;
  final String name;

  Category({required this.imagUrl, required this.name});
}
