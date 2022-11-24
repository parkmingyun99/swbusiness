import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:my_app/camera_ex.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  late UserProvider _userProvider;
  File? _image;
  //final XFile? _image = await ImagePicker().pickImage(source: ImageSource.gallery);
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    // final image = await picker.pickImage(source: imageSource);
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  Widget showImage() {return Container(
      color: const Color(0xffd0cece),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Center(
          child: _image == null
              ? Text('No image selected.')
              : Image.file(File(_image!.path))));
  }




  @override
  Widget build(BuildContext context) {

    _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('menu button is clicked');
          },
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.shopping_cart),
          //   onPressed: () {
          //     print('shopping cart button is clicked');
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              print('search button is clicked');
            },
          )
        ],
        title: Text('유저화면'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                child: showImage(),
                backgroundImage: AssetImage('assets/graduate-gonji.jpeg'),
                radius: 50.0,

              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.add_a_photo),
              tooltip: 'pick Iamge',
              onPressed: () {
                getImage(ImageSource.gallery);
              },
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.8,
              endIndent: 30.0,
            ),
            Text('NAME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 3.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(_userProvider.nickname,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('운동 경력',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('1.9 year',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Today My WorkOut',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Row(children: [
              Icon(Icons.check_circle_outline),
              SizedBox(width: 5,),
              Text('Bench Press',
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0
                ),
              ),
            ],
            ),
            Row(children: [
              Icon(Icons.check_circle_outline),
              SizedBox(width: 5,),
              Text('Rat Full Down',
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0
                ),
              ),
            ],
            ),
            Row(children: [
              Icon(Icons.check_circle_outline),
              SizedBox(width: 5,),
              Text('Dead Lift',
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0
                ),
              ),
            ],
            ),
            SizedBox(
              height: 20.0,
            ),
            // Center(
            //   child: CircleAvatar(
            //     backgroundImage:  AssetImage('assets/transparent.gif'),
            //     radius: 30.0,
            //     backgroundColor: Colors.amber[400],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}