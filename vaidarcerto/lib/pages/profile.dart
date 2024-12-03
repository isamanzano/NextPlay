import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
   void initState() {
    super.initState();

    // Verificar se já há um usuário logado
    _checkUserLoggedIn();
  }

 void _checkUserLoggedIn() {
    User? user = _auth.currentUser;

    if (user != null) {
      // Se o usuário estiver logado, exibe o emai  l
      print("Usuário logado: ${user.email}");
    } else {
      // Caso contrário, avisa que ninguém está logado
      print("Nenhum usuário logado.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificar Usuário Logado')),
      body: Center(
        child: ElevatedButton(
          onPressed: _checkUserLoggedIn,
          child: Text('Verificar Usuário Logado'),
        ),
      ),
    );
  }
}