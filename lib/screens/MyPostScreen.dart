import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../post.dart';
import '../postDetail.dart';
import '../postList.dart';
import '../provider/userProvider.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreen();
}

class _MyPostScreen extends State<MyPostScreen> {
  late UserProvider _userProvider;

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context);
    print(_userProvider.uid);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '내가 쓴 게시글',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 3.0,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Stack(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Expanded(
                child: MyPostBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPostBuilder extends StatefulWidget {
  const MyPostBuilder({super.key});

  @override
  State<MyPostBuilder> createState() => _MyPostBuilder();
}

class _MyPostBuilder extends State<MyPostBuilder> {
  @override
  Widget build(BuildContext context) {
    late UserProvider _userProvider;
    _userProvider = Provider.of<UserProvider>(context);
    Query<Map<String, dynamic>> postFilterLocation = FirebaseFirestore.instance
        .collection("Post")
        .where('Uid', isEqualTo: _userProvider.uid)
        .where('isDeleted', isEqualTo: false);

    return StreamBuilder(
      stream: postFilterLocation.snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final postDocs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: postDocs.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Post post = Post.fromQuerySnapshot(postDocs[index]);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => postDetailPage(post)));
              },
              child: PostList(
                postDocs[index]['Content'],
                postDocs[index]['Title'],
                postDocs[index]['WriterName'],

              ),
            );
          },
        );
      },
    );
  }
}

//
