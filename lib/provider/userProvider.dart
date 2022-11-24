
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _uid="";
  String _email = ""; //사용자 이메일
  String _password = ""; //사용자 비밀번호
  String _nickname=""; //사용자 닉네임 (게시글 작성 시)
  List<String> _posts=[]; //사용자 게시글

  String get uid=>_uid;
  String get email => _email;
  String get password => _password;
  String get nickname => _nickname;
  List<String> get posts=>_posts;


  void signup(String _uid, String _email, String _password, String _nickname){
    this._uid=_uid;
    this._email=_email;
    this._password=_password;
    this._nickname=_nickname;
    this._posts=[];
    notifyListeners();
  }

  void login( String _uid, String _email, String _password, String _nickname, List<String> _posts) {
    this._uid=_uid;
    this._email=_email;
    this._password=_password;
    this._nickname=_nickname;
    this._posts=_posts;
    notifyListeners();
  }

  void set uid(String input_uid){
    _uid=input_uid;
    notifyListeners();
  }

  void set email(String input_email) {
    _email = input_email;
    notifyListeners();
  }

  void set password(String input_password) {
    _password = input_password;
    notifyListeners();
  }

  void set nickname(String input_nickname){
    _nickname=input_nickname;
    notifyListeners();
  }

  void set posts(List<String> input_posts){
    _posts=input_posts;
    notifyListeners();
  }


  void addPost(String postId){
    _posts.add(postId);
    notifyListeners();
  }


}

