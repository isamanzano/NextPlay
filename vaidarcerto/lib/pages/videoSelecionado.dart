// TELA FEITA POR ENZO BUSSI


import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/home.dart';
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
  bool isChatExpanded = false;
  bool isFollowing = false;
  String? selectedIcon;
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];
  

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

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text);
        _messageController.clear();
      });
    }
  }

  void toggleIcon(String iconType) {
    setState(() {
      selectedIcon = selectedIcon == iconType ? null : iconType;
    });
  }

  Widget _buildChatSection() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isChatExpanded = !isChatExpanded;
            });
          },
          child: Container(
            color: Colors.grey[800],
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isChatExpanded ? 'Recolher Comentários' : 'Expandir Comentários',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Icon(
                  isChatExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        if (isChatExpanded)
          Container(
            color: Colors.grey[900],
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              _messages[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Digite um comentário...',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _sendMessage,
                      icon: const Icon(Icons.send, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildRecommendationCards() {
  // Simulação de um tipo associado ao vídeo atual
  final String currentVideoType = "esporte"; // Substitua com a lógica que identifica o tipo do vídeo

  // Filtra os cards que correspondem ao tipo do vídeo atual
  final filteredCards = cardsData.where((data) => data.type == currentVideoType).toList();

  // Se não houver correspondência, seleciona cards aleatórios
  final cardsToDisplay = filteredCards.isNotEmpty
      ? filteredCards.take(3).toList()
      : (cardsData.toList()..shuffle()).take(3).toList();

  return Column(
    children: cardsToDisplay.map((data) {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink.image(
              image: AssetImage(data.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemSelecionado(
                        videoTitle: data.title,
                        channelName: data.channelName,
                        videoCode: data.videoCode,
                        avatarImage: data.avatarImageUrl,
                        videoInfo: data.views,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(data.avatarImageUrl),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${data.channelName} • ${data.views}',
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
    }).toList(),
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
                  _buildChatSection(),
                  _buildRecommendationCards(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
