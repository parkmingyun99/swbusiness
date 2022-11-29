import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkmingyun/provider/userProvider.dart';
import 'package:provider/provider.dart';



class abc extends StatefulWidget {
  const abc({Key? key}) : super(key: key);

  @override
  _abc createState() => _abc();
}

class _abc extends State<abc> {
  late UserProvider _userProvider;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(controller: controller),
        actions: [
          IconButton(
              onPressed: () {
                final name=controller.text;

                createUser(name:name);
              },
              icon: Icon(Icons.add)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_userProvider.uid),
            Text(_userProvider.nickname),
            Text(_userProvider.email),
            Text(_userProvider.password),
          ],
        ),
      ),
    );
  }




  Future createUser({required String name}) async {
    print('called');
    final docUser=FirebaseFirestore.instance.collection('users').doc('myy-id');

    final json = {
      'name':name,
      'age':21,
      'birthday':DateTime(2001,7,28),
    };


    await docUser.set(json);

  }

}