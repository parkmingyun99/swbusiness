import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => UserProvider(),
        child: MaterialApp(
          title: "TodayCompletesWorkout", // 앱 이름
          debugShowCheckedModeBanner: false, // 타이틀 바 우측 띠 제거

          // 앱의 기본적인 테마를 지정
          theme: ThemeData(
              primarySwatch: Colors.red // priamrySwatch 기본적인 앱의 색상을 지정
          ),

          home: const LoginScreen(), // 앱이 실행될 때 표시할 화면의 함수를 호출
        ));
  }
}
