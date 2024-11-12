import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/home.dart';
import 'package:vaidarcerto/shared/style.dart';

void main() {
  runApp(Voce());
}

class Voce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: VoceScreen(), 
    );
  }
}

class VoceScreen extends StatefulWidget {
  @override
  _VoceScreenState createState() => _VoceScreenState();
}

class _VoceScreenState extends State<VoceScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
    );
  }
}