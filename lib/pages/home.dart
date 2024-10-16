import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tindog_app/app_state.dart';
import 'package:tindog_app/main.dart';
import 'package:tindog_app/models/petResponse.dart';
import 'package:tindog_app/widget/bottonNavigation.dart';
import 'package:tindog_app/widget/pet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.IdTutor});

  final int IdTutor;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PetResponse> pets = []; // Inicialize como uma lista vazia

  @override
  void initState() {
    super.initState();
    _buscarPets(); // Inicie a busca de pets
  }

  Future<void> _buscarPets() async {
    var appState = context.read<AppState>();
    final fetchedPets = await appState.BuscarPets(widget.IdTutor);
    setState(() {
      pets = fetchedPets!; // Atualiza o estado com os pets obtidos
    });
  }

  int calcularIdade(DateTime dataNascimento) {
    final hoje = DateTime.now();
    final idade = hoje.year - dataNascimento.year;

    // Verifica se já fez aniversário este ano
    if (hoje.month < dataNascimento.month ||
        (hoje.month == dataNascimento.month && hoje.day < dataNascimento.day)) {
      return idade - 1; // Se não fez aniversário ainda, subtrai 1
    }

    return idade; // Retorna a idade calculada
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(),
      bottomNavigationBar: BottonNavigation(),
    );
  }
}
