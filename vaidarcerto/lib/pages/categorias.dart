import 'package:flutter/material.dart';
import 'package:vaidarcerto/pages/home.dart'; 
import 'package:vaidarcerto/shared/style.dart';

void main() {
  runApp(Categorias());
}

class Categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: CategoriasScreen(), 
    );
  }
}

class CategoriasScreen extends StatefulWidget {
  @override
  _CategoriasScreenState createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentPageIndex = 0;

  final List<Game> games = [
    Game('Valorant', 'assets/valorantcard.jpg'),
    Game('CS2', 'assets/cs2card.jpg'),
    Game('La liga', 'assets/laligacard.jpg'),
    Game('Minecraft', 'assets/minecraftcard.jpg'),
    Game('Fifa', 'assets/fifacard.jpg'),
    Game('Brasileirão', 'assets/brasileiraocard.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home())); 
          },
        ),
        title: Text("Categorias"),
  ),

      // Grid de cards 
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 0.7, 
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: games.length,
          itemBuilder: (context, index) {
            return GameCard(game: games[index]);
          },
        ),
      ),

      // NAVBAR
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search, color: Colors.white),
            label: 'Pesquisa',
          ),
          NavigationDestination(
            icon: Icon(Icons.history, color: Colors.white),
            label: 'Histórico',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Você',
          ),
        ],
      ),
    );
  }
}

// Card continuação
class Game {
  final String name;
  final String imageUrl;

  Game(this.name, this.imageUrl);
}

// Cada card 
class GameCard extends StatelessWidget {
  final Game game;

  GameCard({required this.game});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(game.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          game.name,
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
