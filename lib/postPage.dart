import 'package:flutter/material.dart';
import 'package:parkmingyun/home.dart';
import 'package:parkmingyun/config/palette.dart';
import 'package:parkmingyun/postStream.dart';
import 'package:parkmingyun/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'newPost.dart';

class postPage extends StatefulWidget {
  const postPage({Key? key}) : super(key: key);

  @override
  _postPage createState() => _postPage();
}

class _postPage extends State<postPage> {

  late UserProvider _userProvider;
  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('운동장',style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        elevation: 3.0,
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => newPost()),
                );
              },
              icon: Icon(Icons.add_box),
              color: Colors.white),
        ],
      ),

      body: Container(
        child: Stack(children: [
        Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Expanded(
          child: Posts(),
        ),
      ),
])),
      );

  }

}