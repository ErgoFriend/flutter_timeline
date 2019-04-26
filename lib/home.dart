import 'package:flutter/material.dart';
import 'package:flutter_timeline/sign_in.dart';
import 'package:flutter_timeline/timeline.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  List<Widget> _bodyList = [
    Timeline(),
    SignInDemo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("ホーム"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("マイページ"),
          ),
        ],
      ),
      body: _bodyList[_currentIndex], 
    );
  }

  _onTap(int i) {
    setState(() {
      _currentIndex = i;
    });
  }
}