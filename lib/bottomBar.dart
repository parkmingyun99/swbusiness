import 'package:flutter/material.dart';


class BottomBar extends StatefulWidget {
  final _selectedIndex;
  final _onItemTapped;
  const BottomBar(this._selectedIndex, this._onItemTapped, {Key? key})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈화면',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cookie_sharp),
          label: '2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.handshake_sharp),
          label: '3',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_rounded),
          label: '4',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_sharp),
          label: '유저화면',
        ),
      ],
      currentIndex: widget._selectedIndex,
      selectedItemColor: Colors.amber[900],
      unselectedItemColor: Colors.grey,
      onTap: widget._onItemTapped,
    );
  }
}
