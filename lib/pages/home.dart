import 'package:flutter/material.dart';
import 'package:tindog_app/main.dart';
import 'package:tindog_app/pages/login_page.dart';
import 'package:tindog_app/pages/pet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.IdTutor});

  final int IdTutor;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PetPage(
        IdTutor: widget.IdTutor,
      ),
      Container(),
      Container(),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home"),
            const SizedBox(width: 10),
            Image.asset("images/icon24.png"),
            const SizedBox(width: 10),
            const Text("Tindog")
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              // Ação com base na seleção
              print('Você selecionou: $value');
              if (value == 'Sair') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false, // Remove todas as rotas
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Adicionar', 'Sair'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/fundo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: pages.elementAt(_currentPage)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Configurações"),
        ],
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
