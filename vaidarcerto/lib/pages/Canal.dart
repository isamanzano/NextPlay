// PÁGINA FEITA POR GABRIEL OLIVEIRA, COM COLABORAÇÃO DE MODELO DE MATHEUS RODOLPHO

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/data/cards_data.dart';
import 'package:vaidarcerto/pages/videoSelecionado.dart';

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
    final valorantCards = widget.profiles.where((profile) {
      return profile.channelName == 'Coreano';
    }).toList();

    final liveCards = widget.profiles.where((profile) {
      return profile.type == 'LIVE';
    }).toList();

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
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            ...valorantCards.map((data) => buildYouTubeCard(
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

      case 1:
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: liveCards.map((data) => buildYouTubeCard(
                context,
                data.title,
                data.imageUrl,
                data.channelName,
                data.views,
                data.avatarImageUrl,
                data.videoCode,
              )).toList(),
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

  Widget buildYouTubeCard(
  BuildContext context,
  String title,
  String imageUrl,
  String channelName,
  String videoInfo,
  String avatarImageUrl,
  String videoCode,
) {
  return Center( // Para alinhar no centro e limitar a largura
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Ajuste a margem
      child: SizedBox(
        width: 400, // Defina a largura desejada
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
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

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
