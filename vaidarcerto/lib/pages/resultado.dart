// //PÁGINA FEITA POR GABRIEL OLIVEIRA 

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/Canal.dart';
import 'package:vaidarcerto/pages/videoSelecionado.dart';
import 'package:vaidarcerto/pages/data/cards_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
    );
  }
}


//  Codigo para cards

class ResultadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Filtrando os itens relacionados a Valorant
    final valorantCards = cardsData.where((card) {
      return card.title.toLowerCase().contains('valorant');
    }).toList();

    final relatedProfiles = profileCards.where((profile) {
      return profile.tags.contains('valorant');
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        // Adicionando os cartões de YouTube relacionados a Valorant
        ...valorantCards.map((data) => buildYouTubeCard(
              context,
              data.title,
              data.imageUrl,
              data.channelName,
              data.views,
              data.avatarImageUrl,
              data.videoCode,
            )),
        // Adicionando os cartões de perfil relacionados a Valorant
        ...relatedProfiles.map((profile) {
          return GestureDetector(
            onTap: () {
              // Navegando para o CanalScreen e passando as informações do perfil
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CanalScreen(
                    channelName: 'Coreano',
                    profileImageUrl: 'assets/coreano.jpg',
                    followers: '170 mil de seguidores',
                    profiles: cardsData, // Certifique-se de passar a lista correta aqui
                  ),
                ),
              );

            },
            child: buildProfileCard(
              context,
              profile.name,
              profile.followers,
              profile.profileImageUrl,
            ),
          );
        }).toList(),
      ],
    );
  }

  // Função para construir o ProfileCard
  Widget buildProfileCard(BuildContext context, String name, String followers,
      String profileImageUrl) {
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
          ],
        ),
      ),
    );
  }
}

Widget buildYouTubeCard(
  BuildContext context,
  String title,
  String imageUrl,
  String channelName,
  String videoInfo, // Este parâmetro já existe
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
                    videoInfo: videoInfo, // Passando as views
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
                      '$channelName • $videoInfo', // Exibindo as views
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
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
