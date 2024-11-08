import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/home.dart';
import 'package:vaidarcerto/shared/style.dart';

class Configuracoes extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}