// PÁGINA FEITA POR GABRIEL OLIVEIRA, COM COLABORAÇÃO DE MODELO DE MATHEUS RODOLPHO

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/data/cards_data.dart';
class CanalScreen extends StatefulWidget {
  final String channelName;
  final String profileImageUrl;
  final String followers;
  final List<YouTubeCardInfo> profiles;

  const CanalScreen({
    Key? key,
    required this.channelName,
    required this.profileImageUrl,
    required this.followers,
    required this.profiles,
  }) : super(key: key);

  @override
  _CanalScreenState createState() => _CanalScreenState();

}

class _CanalScreenState extends State<CanalScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    // Filtrando os cards relacionados ao Valorant
    final valorantCards = widget.profiles.where((profile) {
      return profile.channelName == 'Coreano';
    }).toList();

    final liveCards = widget.profiles.where((profile) {
      return profile.category == 'Valorant_live';
    }).toList();

    print(widget.profiles.length); // Verifica quantos perfis estão sendo recebidos


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
          width: 300.0,
          height: 600.0,
          color: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(widget.profileImageUrl),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.channelName,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    widget.followers,
                    style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 138, 138, 138)),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              Container(
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TabButton(
                            title: 'Vídeos',
                            isSelected: _selectedTab == 0,
                            onTap: () {
                              setState(() {
                                _selectedTab = 0;
                              });
                            },
                          ),
                          TabButton(
                            title: 'Lives',
                            isSelected: _selectedTab == 1,
                            onTap: () {
                              setState(() {
                                _selectedTab = 1;
                              });
                            },
                          ),
                          TabButton(
                            title: 'Fixados',
                            isSelected: _selectedTab == 2,
                            onTap: () {
                              setState(() {
                                _selectedTab = 2;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: _getSelectedTabWidget(valorantCards, liveCards)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSelectedTabWidget(List<YouTubeCardInfo> valorantCards, List<YouTubeCardInfo> liveCards) {
    switch (_selectedTab) {
      case 0:
        return ListView(
          children: valorantCards.map((data) {
            return buildYouTubeCard(
              context,
              data.title,
              data.imageUrl,
              data.channelName,
              data.views,
              data.avatarImageUrl,
            );
          }).toList(),
        );
      case 1:
        return ListView(
          children: liveCards.map((data) {
            return buildYouTubeCard(
              context,
              data.title,
              data.imageUrl,
              data.channelName,
              data.views,
              data.avatarImageUrl,
            );
          }).toList(),
        );
      case 2:
        return Center(
          child: Text(
            '${widget.channelName} não possui vídeos fixados',
            style: const TextStyle(color: Colors.white),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

Widget buildYouTubeCard(
  BuildContext context,
  String title,
  String imageUrl,
  String channelName,
  String views,
  String avatarImageUrl,
) {
  return Card(
    color: Colors.black,
    child: Column(
      children: [
        Image.asset(imageUrl, fit: BoxFit.cover),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(avatarImageUrl),
          ),
          title: Text(title, style: const TextStyle(color: Colors.white)),
          subtitle: Text('$channelName • $views', style: const TextStyle(color: Colors.grey)),
        ),
      ],
    ),
  );
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: isSelected ? Colors.blue : Colors.grey),
        ),
      ),
    );
  }
}


