import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/conta.dart';
import 'package:vaidarcerto/pages/categorias.dart';
import 'package:vaidarcerto/pages/configuracoes.dart';
import 'package:vaidarcerto/pages/pesquisa.dart';
import 'package:vaidarcerto/pages/historico.dart';
import 'package:vaidarcerto/pages/voce.dart';


void main() {
  runApp(Resultado());
}


class Resultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: ResultadoScreen(),
    );
  }
}


class ResultadoScreen extends StatefulWidget {
  @override
  _ResultadoScreenState createState() => _ResultadoScreenState();
}


class _ResultadoScreenState extends State<ResultadoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedValue;
  bool _isDropdownOpened = false;


  void _toggleDropdown() {
    setState(() {
      _isDropdownOpened = !_isDropdownOpened;
    });
  }


  int currentPageIndex = 0;
 
  final List<Widget> pages = [
    ResultadoPage(),
    Pesquisa(),
    Historico(),
    Voce(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      //  appBar: AppBar(
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.menu),
      //     onPressed: () {
      //       _scaffoldKey.currentState?.openDrawer();
      //     },
      //   ),
      // ),


      // // DRAWER
      // drawer: Drawer(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: <Widget>[
      //       AppBar(
      //         elevation: 0,
      //         leading: IconButton(
      //           icon: Icon(Icons.menu),
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //         ),
      //       ),
      //       Spacer(),
      //       ListTile(
      //         leading: Icon(Icons.person),
      //         title: Text('Conta'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Conta()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.video_library),
      //         title: Text('Categorias'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Categorias()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('Configurações'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Configuracoes()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // Exibe a página atual
      body: pages[currentPageIndex],

    );
  }
}


// CARD ESTILO YOUTUBE
class ResultadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        buildYouTubeCard(
          context,
          'VALORANT AO VIVO! - O NOVO JOGO DO MOMENTO?',
          'assets/valorantaovivo.jpg',
          'Ei Games',
          '15 mil de visualizações',
          'assets/eigames.jpg',
        ),
        buildYouTubeCard(
          context,
          'VALORANT AO VIVO! - O NOVO JOGO DO MOMENTO?',
          'assets/valorantaovivo.jpg',
          'Ei Games',
          '15 mil de visualizações',
          'assets/eigames.jpg',
        ),


        // Novo cartão de perfil entre o terceiro e quarto cartão de estilo YouTube
        buildProfileCard(
          context,
          'COREANO',
          '170 mil seguidores',
          'assets/profile_image.jpg', // Substitua pelo caminho real da imagem de perfil
        ),
       
        buildYouTubeCard(
          context,
          'VALORANT AO VIVO! - O NOVO JOGO DO MOMENTO?',
          'assets/valorantaovivo.jpg',
          'Ei Games',
          '15 mil de visualizações',
          'assets/eigames.jpg',
        ),
        buildYouTubeCard(
          context,
          'VALORANT AO VIVO! - O NOVO JOGO DO MOMENTO?',
          'assets/valorantaovivo.jpg',
          'Ei Games',
          '15 mil de visualizações',
          'assets/eigames.jpg',
        ),
      ],
    );
  }


  // Função para construir o cartão de perfil
  Widget buildProfileCard(BuildContext context, String name, String followers, String profileImageUrl) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(profileImageUrl),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              followers,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Adicione ação do botão de seguir aqui
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Seguir'),
            ),
          ],
        ),
      ),
    );
  }


  // Função para construir o cartão de estilo YouTube
  Widget buildYouTubeCard(
    BuildContext context,
    String title,
    String imageUrl,
    String channelName,
    String videoInfo,
    String avatarImageUrl,
  ) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ink.image(
            image: AssetImage(imageUrl),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {
                // Adicione função para abrir o URL
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(avatarImageUrl),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$channelName • $videoInfo',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
