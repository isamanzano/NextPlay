import 'package:flutter/material.dart';

void main() {
  runApp(Pesquisa());
}

class Pesquisa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: PesquisaScreen(),
    );
  }
}

class PesquisaScreen extends StatefulWidget {
  @override
  _PesquisaScreenState createState() => _PesquisaScreenState();
}

class _PesquisaScreenState extends State<PesquisaScreen> {
  final List<String> searchHistory = [
    "Valorant",
    "Jogo Real Madrid ao vivo",
    "Fallen",
    "Jogo Corinthians ao vivo"
  ];

  // Controlador do TextField
  TextEditingController _controller = TextEditingController();
  String query = '';

  // Método para tratar mudança no texto de pesquisa
  void _onSearchChanged(String value) {
    setState(() {
      query = value;
    });
  }

  // Resultados baseados no histórico de pesquisa
  List<String> _getSearchResults() {
    return searchHistory
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberar o controlador quando não for mais necessário
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _controller,
                  onChanged: _onSearchChanged,
                  autofocus: true,
                  style: TextStyle(color: Colors.black), // Define a cor do texto para preto
                  decoration: InputDecoration(
                    hintText: 'Encontre seu jogo',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  setState(() {
                    // Atualiza o estado para forçar o rebuild dos resultados
                    query = _controller.text;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Exibe os resultados da pesquisa
            Expanded(
              child: query.isEmpty
                  ? ListView.builder(
                      itemCount: searchHistory.length,
                      itemBuilder: (context, index) {
                        final suggestion = searchHistory[index];
                        return ListTile(
                          leading: Icon(Icons.history, color: Colors.white54),
                          title: Text(suggestion, style: TextStyle(color: Colors.white)),
                          onTap: () {
                            setState(() {
                              query = suggestion;
                              _controller.text = suggestion; // Atualiza o campo de pesquisa
                            });
                          },
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: _getSearchResults().length,
                      itemBuilder: (context, index) {
                        final result = _getSearchResults()[index];
                        return ListTile(
                          title: Text(result, style: TextStyle(color: Colors.white)),
                          onTap: () {
                            // Ação ao clicar no resultado (pode ser personalizada)
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
