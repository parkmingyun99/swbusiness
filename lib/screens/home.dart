import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/userInfo.dart';
import 'package:my_app/screens/home_view.dart';
import '../bottomBar.dart';
import '../camera_ex.dart';
import '../crudExam.dart';
import 'package:my_app/screens/welcom_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  // bottom bar info
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    abc(),
    abc(),
    Text(
      '2',
      style: optionStyle,
    ),
    Text(
      '4',
      style: optionStyle,
    ),
    UserPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('오운완'),
      //   actions: [
      //     IconButton(
      //         icon: Icon(
      //           Icons.exit_to_app_sharp,
      //           color: Colors.black,
      //         ),
      //         onPressed: () {
      //           // _authentication.signOut();
      //           Navigator.pop(context);
      //         })
      //   ],
      // ),
      body: WelcomView(),
      bottomNavigationBar: BottomBar(_selectedIndex, _onItemTapped),
    );
  }
}

class WelcomeView {
}
