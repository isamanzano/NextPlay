// PÁGINA FEITO POR GABRIEL OLIVEIRA, COM COLABORAÇÃO DE ISABELA MANZANO

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/pesquisa.dart';
import 'package:vaidarcerto/pages/voce.dart';
import 'package:vaidarcerto/pages/videoSelecionado.dart';
import 'package:vaidarcerto/pages/data/cards_data.dart';

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
 
  final List<Widget> pages = [
    HistoricoPage(),
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
      
      // Exibe a página atual
      body: pages[currentPageIndex],

    );
  }
}


// CARD ESTILO YOUTUBE
class HistoricoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista de títulos específicos
    final List<String> selectedTitles = [
      'VALORANT RUMO A PRATA!!!! (FloridoGM) (Ao Vivo)',
      'FUTEBOL AO VIVO 1º Campeonato Brasileiro online de FIFA Soccer 11 Here comes a new challenger!',
      'MANCHESTER CITY X REAL MADRID TRANSMISSÃO AO VIVO DIRETO DO ETIHAD STADIUM - CHAMPIONS LEAGUE 2023',
      'CS:GO Source 2 Beta AO VIVO - Explorando o NOVO CS2 🔥 + Doando SKINS',
      
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