// PÁGINA FEITO POR GABRIEL OLIVEIRA, COM COLABORAÇÃO DE ISABELA MANZANO

import 'package:flutter/material.dart';


void main() {
  runApp(Historico());
}


class Historico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HistoricoScreen(),
    );
  }
}


class HistoricoScreen extends StatefulWidget {
  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}


class _HistoricoScreenState extends State<HistoricoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedValue;
  bool _isDropdownOpened = false;


  void _toggleDropdown() {
    setState(() {
      _isDropdownOpened = !_isDropdownOpened;
    });
  }


  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
    );
  }
}