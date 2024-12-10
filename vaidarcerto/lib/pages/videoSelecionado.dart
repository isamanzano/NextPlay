// // TELA FEITA POR ENZO BUSSI

// import 'package:flutter/material.dart';
// import 'package:vaidarcerto/pages/home.dart';
// import 'package:vaidarcerto/pages/Canal.dart';
// import 'package:vaidarcerto/pages/data/cards_data.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// void main() {
//   runApp(Home());
// }

// class itemSelecionado extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: '',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       home: videoSelecionadoScreen(),
//     );
//   }
// }

// class videoSelecionadoScreen extends StatefulWidget {
//   @override
//   _videoSelecionadoScreenState createState() => _videoSelecionadoScreenState();
// }

// class _videoSelecionadoScreenState extends State<videoSelecionadoScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   int currentPageIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       currentPageIndex = index;
//     });
//   }

//  @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     key: _scaffoldKey,
    
//   );
// }
// }

// class ItemSelecionado extends StatefulWidget {
//   final String videoTitle;
//   final String channelName;
//   final String videoCode;
//   final String avatarImage;
//   final String videoInfo; // Adicionando o parâmetro para views

//   const ItemSelecionado({
//     Key? key,
//     required this.videoTitle,
//     required this.channelName,
//     required this.videoCode,
//     required this.avatarImage,
//     required this.videoInfo, // Adicionando o parâmetro para views
//   }) : super(key: key);

//   @override
//   _ItemSelecionadoState createState() => _ItemSelecionadoState();
// }

// class _ItemSelecionadoState extends State<ItemSelecionado> {
//   late YoutubePlayerController _controller;
//   bool isFollowing = false;
//   String? selectedIcon;

//   final TextEditingController _messageController = TextEditingController();
//   final List<String> _messages = [];

//   void toggleIcon(String iconType) {
//     setState(() {
//       selectedIcon = selectedIcon == iconType ? null : iconType;
//     });
//   }

//   void _sendMessage() {
//     if (_messageController.text.isNotEmpty) {
//       setState(() {
//         _messages.add(_messageController.text);
//         _messageController.clear();
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoCode,
//       flags: YoutubePlayerFlags(autoPlay: true, mute: false),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.chevron_left, color: Colors.blue),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0.0,
//       ),
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Container(
//                 color: Colors.black,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: YoutubePlayer(
//                           controller: _controller,
//                           showVideoProgressIndicator: true,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: Text(
//                           widget.videoTitle, // Título atualizado para usar a variável
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           const SizedBox(width: 8),
//                           CircleAvatar(
//                             radius: 30,
//                             backgroundImage: AssetImage(widget.avatarImage),
//                           ),
//                           const SizedBox(width: 10),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 widget.channelName, // Nome do canal atualizado
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                                Text(
//                                 widget.videoInfo,
//                                 style: TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Spacer(),
//                           ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 isFollowing = !isFollowing;
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 6, horizontal: 14),
//                             ),
//                             child: Text(
//                               isFollowing ? 'Seguindo' : 'Seguir',
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             onPressed: () => toggleIcon('like'),
//                             icon: Icon(
//                               Icons.thumb_up,
//                               color: selectedIcon == 'like'
//                                   ? Colors.blue
//                                   : Colors.white,
//                             ),
//                             iconSize: 20,
//                             constraints: const BoxConstraints(
//                               minWidth: 20,
//                               minHeight: 20,
//                             ),
//                             padding: EdgeInsets.zero,
//                             splashRadius: 30,
//                           ),
//                           IconButton(
//                             onPressed: () => toggleIcon('unlike'),
//                             icon: Icon(
//                               Icons.thumb_down,
//                               color: selectedIcon == 'unlike'
//                                   ? Colors.blue
//                                   : Colors.white,
//                             ),
//                             iconSize: 20,
//                             constraints: const BoxConstraints(
//                               minWidth: 20,
//                               minHeight: 20,
//                             ),
//                             padding: EdgeInsets.zero,
//                             splashRadius: 30,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       const Align(
//                         alignment: Alignment.topCenter,
//                         child: Text(
//                           'Comentários',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       // Seção de chat com borda cinza
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[900],
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.black),
//                           ),
//                           child: Column(
//                             children: [
//                               // Exibe as mensagens do chat
//                               SizedBox(
//                                 height: 150,
//                                 width: 280,
//                                 child: ListView.builder(
//                                   reverse: true,
//                                   itemCount: _messages.length,
//                                   itemBuilder: (context, index) {
//                                     return Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 5, horizontal: 10),
//                                       child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Container(
//                                           padding: const EdgeInsets.all(10),
//                                           decoration: BoxDecoration(
//                                             color: Colors.blue[100],
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: Text(
//                                             _messages[index],
//                                             style: const TextStyle(fontSize: 16),
//                                           ),
//                                         ),
//                                       ),
//                                     );
                                    
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[900],
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.black),
//                           ),
//                           child: Column(
//                             children: [
//                               // Exibe as mensagens do chat
//                               SizedBox(
//                                 height: 150,
//                                 width: 280,
//                                 child: ListView.builder(
//                                   reverse: true,
//                                   itemCount: _messages.length,
//                                   itemBuilder: (context, index) {
//                                     return Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 5, horizontal: 10),
//                                       child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Container(
//                                           padding: const EdgeInsets.all(10),
//                                           decoration: BoxDecoration(
//                                             color: Colors.blue[100],
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: Text(
//                                             _messages[index],
//                                             style: const TextStyle(fontSize: 16),
//                                           ),
//                                         ),
//                                       ),
//                                     );
                                    
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[900],
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.black),
//                           ),
//                           child: Column(
//                             children: [
//                               // Exibe as mensagens do chat
//                               SizedBox(
//                                 height: 150,
//                                 width: 280,
//                                 child: ListView.builder(
//                                   reverse: true,
//                                   itemCount: _messages.length,
//                                   itemBuilder: (context, index) {
//                                     return Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 5, horizontal: 10),
//                                       child: Align(
//                                         alignment: Alignment.centerLeft,
//                                         child: Container(
//                                           padding: const EdgeInsets.all(10),
//                                           decoration: BoxDecoration(
//                                             color: Colors.blue[100],
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: Text(
//                                             _messages[index],
//                                             style: const TextStyle(fontSize: 16),
//                                           ),
//                                         ),
//                                       ),
//                                     );
                                    
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                   Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Container(
//     decoration: BoxDecoration(
//       color: Colors.grey[900], // Fundo da caixa
//       borderRadius: BorderRadius.circular(10),
//       border: Border.all(color: Colors.black), // Borda da caixa
//     ),
//     child: Column(
//       children: [
//         // Adiciona a imagem com bordas arredondadas
//         // Padding(
//         //   padding: const EdgeInsets.all(8.0),
//         //   child: ClipRRect(
//         //     borderRadius: BorderRadius.circular(10), // Mesmo raio da caixa
//         //     child: Image.asset(
//         //       './assets/images/card.jpg', // Caminho da imagem
//         //       fit: BoxFit.cover,
//         //       width: 100, // Tamanho ajustado à largura da caixa
//         //       height: 80, // Altura proporcional
//         //     ),
//         //   ),
//         // ),
//         const Divider(
//           color: Colors.black, // Linha de separação
//           height: 1,
//           thickness: 0.5,
//         ),
//         // Exibe as mensagens do chat
//         SizedBox(
//           height: 150,
//           width: 280,
//           child: ListView.builder(
//             reverse: true,
//             itemCount: _messages.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.blue[100],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       _messages[index],
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   ),
// ),


//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // Campo de digitação fixo na parte inferior da tela
//             // Positioned(
//             //   bottom: 0,
//             //   left: 0,
//             //   right: 0,
//             //   child: Padding(
//             //     padding: const EdgeInsets.all(8.0),
//             //     child: Container(
//             //       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//             //       decoration: BoxDecoration(
//             //         color: Colors.grey[900],
//             //         borderRadius: BorderRadius.circular(10),
//             //         border: Border.all(color: Colors.black),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// TELA FEITA POR ENZO BUSSI

import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/home.dart';
import 'package:vaidarcerto/pages/Canal.dart';
import 'package:vaidarcerto/pages/data/cards_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(Home());
}

class ItemSelecionado extends StatefulWidget {
  final String videoTitle;
  final String channelName;
  final String videoCode;
  final String avatarImage;
  final String videoInfo;

  const ItemSelecionado({
    Key? key,
    required this.videoTitle,
    required this.channelName,
    required this.videoCode,
    required this.avatarImage,
    required this.videoInfo,
  }) : super(key: key);

  @override
  _ItemSelecionadoState createState() => _ItemSelecionadoState();
}

class _ItemSelecionadoState extends State<ItemSelecionado> {
  late YoutubePlayerController _controller;
  bool isFollowing = false;
  String? selectedIcon;
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];

  void toggleIcon(String iconType) {
    setState(() {
      selectedIcon = selectedIcon == iconType ? null : iconType;
    });
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text);
        _messageController.clear();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoCode,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildChatMessage(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildCommentSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
              height: 1,
              thickness: 0.5,
            ),
            SizedBox(
              height: 150,
              width: 280,
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildChatMessage(_messages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      widget.videoTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(widget.avatarImage),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.channelName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.videoInfo,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isFollowing = !isFollowing;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 14),
                        ),
                        child: Text(
                          isFollowing ? 'Seguindo' : 'Seguir',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => toggleIcon('like'),
                        icon: Icon(
                          Icons.thumb_up,
                          color: selectedIcon == 'like'
                              ? Colors.blue
                              : Colors.white,
                        ),
                        iconSize: 20,
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        padding: EdgeInsets.zero,
                        splashRadius: 30,
                      ),
                      IconButton(
                        onPressed: () => toggleIcon('unlike'),
                        icon: Icon(
                          Icons.thumb_down,
                          color: selectedIcon == 'unlike'
                              ? Colors.blue
                              : Colors.white,
                        ),
                        iconSize: 20,
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        padding: EdgeInsets.zero,
                        splashRadius: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Comentários',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildCommentSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

Widget build(BuildContext context) {
  // Seleciona 3 itens aleatórios de cardsData
  final randomCards = (cardsData.toList()..shuffle()).take(3).toList();

  return ListView(
    padding: const EdgeInsets.all(8.0),
    children: [
      // Renderizando os cartões selecionados aleatoriamente
      ...randomCards.map((data) => buildYouTubeCard(
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

// consertar chat e colocar os cards em baixo 