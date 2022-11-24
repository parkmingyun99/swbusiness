import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class abc extends StatefulWidget {
  const abc({Key? key}) : super(key: key);

  @override
  _abc createState() => _abc();
}

class _abc extends State<abc> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
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
      );


  Future createUser({required String name}) async {
    print('called');
    final docUser=FirebaseFirestore.instance.collection('users').doc('my-id');

    // final user=User(
    //   id: docUser.id,
    //   name: name,
    //   age: 21,
    //   birthday: DateTime(2001,7,28),
    // );

    final json = {
    'name':name,
      'age':21,
      'birthday':DateTime(2001,7,28),
  };


    await docUser.set(json);

  }

}
//
// class User{
//   String id;
//   final String name;
//   final int age;
//   final DateTime birthday;
//
//   User({
//     this.id='',
//     required this.name,
//     required this.age,
//     required this.birthday,
//   });
//   Map<String, dynamic> toJson() => {
//     'id':id,
//     'name':name,
//     'age':age,
//     'birthday':birthday,
//   };
// }
//
