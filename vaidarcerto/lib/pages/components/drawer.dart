import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/conta.dart';
import 'package:vaidarcerto/pages/categorias.dart';
import 'package:vaidarcerto/pages/configuracoes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AppBar(
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Conta'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Conta()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text('Categorias'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Categorias()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Configuracoes()),
              );
            },
          ),
        ],
      ),
    );
  }
}
