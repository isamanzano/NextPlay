// PÁGINA LIGADA A HOME - ISABELA MANZANO, COM COLABORAÇÃO DE GABRIEL OLIVEIRA E AUXILIO DE THIAGO

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/pesquisa.dart';
import 'package:vaidarcerto/pages/historico.dart';
import 'package:vaidarcerto/pages/voce.dart';
import 'package:vaidarcerto/pages/videoSelecionado.dart';
import 'package:vaidarcerto/pages/data/cards_data.dart';


void main() {
  runApp(Principal());
}


class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: PrincipalScreen(),
    );
  }
}


class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}


class _PrincipalScreenState extends State<PrincipalScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  int currentPageIndex = 0;
 
  final List<Widget> pages = [
    const PrincipalPage(),
    Pesquisa(),
    Historico(),
    VoceScreen(),
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
    
    body: pages[currentPageIndex], // Verifique se pages não é vazio
  );
}
}

// CARD ESTILO YOUTUBE
class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de títulos específicos
    final List<String> selectedTitles = [
      'TSUNAMI AUTOMÁTICO - Minecraft Em busca da casa automática #308',
      'VALORANT AO VIVO! - O NOVO JOGO DO MOMENTO?',
      'MANCHESTER CITY X REAL MADRID TRANSMISSÃO AO VIVO DIRETO DO ETIHAD STADIUM - CHAMPIONS LEAGUE 2023',
      'Farm de Madeira 100% Automática - Minecraft Em busca da casa automática #342'
    ];

    // Filtrando os itens que correspondem aos títulos
    final filteredCards = cardsData.where((card) {
      return selectedTitles.contains(card.title);
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        // Renderizando os cartões filtrados
        ...filteredCards.map((data) => buildYouTubeCard(
              context,
              data.title,
              data.imageUrl,
              data.channelName,
              data.views,
              data.avatarImageUrl,
              data.videoCode,
            )),
      ],
    );
  }

  Widget buildYouTubeCard(
    BuildContext context,
    String title,
    String imageUrl,
    String channelName,
    String videoInfo,
    String avatarImageUrl,
    String videoCode,
  ) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemSelecionado(
                      videoTitle: title,
                      channelName: channelName,
                      videoCode: videoCode,
                      avatarImage: avatarImageUrl,
                      videoInfo: videoInfo,
                    ),
                  ),
                );
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
                            fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$channelName • $videoInfo',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
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
