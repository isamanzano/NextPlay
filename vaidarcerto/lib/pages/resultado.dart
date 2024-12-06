// //PÁGINA FEITA POR GABRIEL OLIVEIRA

// import 'package:flutter/material.dart';
// import 'package:vaidarcerto/pages/Canal.dart';
// import 'package:vaidarcerto/pages/pesquisa.dart';
// import 'package:vaidarcerto/pages/historico.dart';
// import 'package:vaidarcerto/pages/voce.dart';

// void main() {
//   runApp(Resultado());
// }

// class Resultado extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: '',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       home: ResultadoScreen(),
//     );
//   }
// }

// class ResultadoScreen extends StatefulWidget {
//   @override
//   _ResultadoScreenState createState() => _ResultadoScreenState();
// }

// class _ResultadoScreenState extends State<ResultadoScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   String? _selectedValue;
//   bool _isDropdownOpened = false;

//   void _toggleDropdown() {
//     setState(() {
//       _isDropdownOpened = !_isDropdownOpened;
//     });
//   }

//   int currentPageIndex = 0;

//   final List<Widget> pages = [
//     ResultadoPage(),
//     Pesquisa(),
//     Historico(),
//     VoceScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       currentPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,

//       //  appBar: AppBar(
//       //   elevation: 0,
//       //   leading: IconButton(
//       //     icon: Icon(Icons.menu),
//       //     onPressed: () {
//       //       _scaffoldKey.currentState?.openDrawer();
//       //     },
//       //   ),
//       // ),

//       // // DRAWER
//       // drawer: Drawer(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.end,
//       //     children: <Widget>[
//       //       AppBar(
//       //         elevation: 0,
//       //         leading: IconButton(
//       //           icon: Icon(Icons.menu),
//       //           onPressed: () {
//       //             Navigator.pop(context);
//       //           },
//       //         ),
//       //       ),
//       //       Spacer(),
//       //       ListTile(
//       //         leading: Icon(Icons.person),
//       //         title: Text('Conta'),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //           Navigator.push(
//       //             context,
//       //             MaterialPageRoute(builder: (context) => Conta()),
//       //           );
//       //         },
//       //       ),
//       //       ListTile(
//       //         leading: Icon(Icons.video_library),
//       //         title: Text('Categorias'),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //           Navigator.push(
//       //             context,
//       //             MaterialPageRoute(builder: (context) => Categorias()),
//       //           );
//       //         },
//       //       ),
//       //       ListTile(
//       //         leading: Icon(Icons.settings),
//       //         title: Text('Configurações'),
//       //         onTap: () {
//       //           Navigator.pop(context);
//       //           Navigator.push(
//       //             context,
//       //             MaterialPageRoute(builder: (context) => Configuracoes()),
//       //           );
//       //         },
//       //       ),
//       //     ],
//       //   ),
//       // ),

//       // Exibe a página atual
//       body: pages[currentPageIndex],

//     );
//   }
// }

// // CARD ESTILO YOUTUBE
// class ResultadoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8.0),
//       children: [
//         buildYouTubeCard(
//           context,
//           'VALORANT AO VIVO! - O NOVO JOGO DO MOMENTO?',
//           'assets/valorantaovivo.jpg',
//           'Ei Games',
//           '15 mil de visualizações',
//           'assets/eigames.jpg',
//         ),
//         buildYouTubeCard(
//           context,
//           'The Round // Gameplay Preview - VALORANT',
//           'assets/valorant.jpg',
//           'VALORANT',
//           '3,6 mi de visualizações',
//           'assets/valorantcanal.jpg',
//         ),

//         buildProfileCard(
//           context,
//           'COREANO',
//           '170 mil seguidores',
//           'assets/coreano.jpg',
//         ),

//         buildYouTubeCard(
//           context,
//           '🔥LIVE AO VIVO VALORANT 🔥 🔥',
//           'assets/valorant2.jpg',
//           'B13 Game',
//           '203 de visualizações',
//           'assets/b13game.jpg',
//         ),
//         buildYouTubeCard(
//           context,
//           'VALORANT Gameplay (PC HD) [1080p60FPS]',
//           'assets/valorant1.jpg',
//           'Throneful',
//           '3,39 mi de visualizações',
//           'assets/throneful.jpg',
//         ),
//       ],
//     );
//   }

//   // Função para construir o cartão de perfil
//   Widget buildProfileCard(BuildContext context, String name, String followers, String profileImageUrl) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pop(context);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const CanalScreen()),
//         );
//       },
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               CircleAvatar(
//                 radius: 40,
//                 backgroundImage: AssetImage(profileImageUrl),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 name,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 followers,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   // Adicione ação do botão de seguir aqui
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: const Text('Seguir'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Função para construir o cartão de estilo YouTube
//   Widget buildYouTubeCard(
//     BuildContext context,
//     String title,
//     String imageUrl,
//     String channelName,
//     String videoInfo,
//     String avatarImageUrl,
//   ) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Ink.image(
//             image: AssetImage(imageUrl),
//             height: 200,
//             width: double.infinity,
//             fit: BoxFit.cover,
//             child: InkWell(
//               onTap: () {
//                 // Adicione função para abrir o URL
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage(avatarImageUrl),
//                   radius: 20,
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         '$channelName • $videoInfo',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/pesquisa.dart';
import 'package:vaidarcerto/pages/historico.dart';
import 'package:vaidarcerto/pages/voce.dart';
import 'package:vaidarcerto/pages/Canal.dart';
import 'package:vaidarcerto/pages/data/cards_data.dart';

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


// ///////////////////////////// Codigo para cards

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
  String videoInfo,
  String avatarImageUrl,
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

class ItemSelecionado extends StatelessWidget {
  final String videoTitle;
  final String channelName;

  const ItemSelecionado({
    Key? key,
    required this.videoTitle,
    required this.channelName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Simulação do player de vídeo
          Container(
            color: Colors.black,
            height: 200,
            width: double.infinity,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          // Detalhes do vídeo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      channelName,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Colocar tela enzo',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Botões de interação
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInteractionButton(
                        Icons.thumb_up_alt_outlined, 'Curtir'),
                    _buildInteractionButton(
                        Icons.thumb_down_alt_outlined, 'Não gostei'),
                    _buildInteractionButton(
                        Icons.share_outlined, 'Compartilhar'),
                    _buildInteractionButton(
                        Icons.library_add_outlined, 'Salvar'),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          // Simulação de comentários
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.person, color: Colors.black),
                  ),
                  title: Text('Usuário $index'),
                  subtitle: const Text('Este é um comentário de exemplo.'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
