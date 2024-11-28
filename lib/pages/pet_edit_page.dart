import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tindog_app/app_state.dart';

class PetEdit extends StatefulWidget {
  const PetEdit({super.key});

  @override
  State<PetEdit> createState() => _PetEditState();
}

class _PetEditState extends State<PetEdit> {
  final NomeController = new TextEditingController();

  String? selectedRacas;

  final List<String> Raca = [
    'Caramelo',
    'Buldogue',
    'Husky',
  ];

  String? selectedGeneros;

  final List<String> Genero = [
    'Macho',
    'Femea',
  ];

  String? selectedPedigrees;

  final List<String> Pedigree = [
    'Sim',
    'Não',
  ];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Editar Informações do Pet'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nome'),
                keyboardType: TextInputType.text,
                controller: NomeController,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Raça'),
                value: selectedRacas,
                items: Raca.map((Raca) {
                  return DropdownMenuItem(
                    value: Raca,
                    child: Text(Raca),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRacas = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Data de Nascimento'),
                keyboardType: TextInputType.datetime,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Peso'),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Genero'),
                value: selectedGeneros,
                items: Genero.map((Genero) {
                  return DropdownMenuItem(
                    value: Genero,
                    child: Text(Genero),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGeneros = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Quantidade de Vacinas'),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Pedigree?'),
                value: selectedPedigrees,
                items: Pedigree.map((Pedigree) {
                  return DropdownMenuItem(
                    value: Pedigree,
                    child: Text(Pedigree),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPedigrees = value;
                  });
                },
              ),
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    appState.EfetuarLogin(
                        // aqui seria a chamada do método para salvar a edição do pet
                        context,
                        NomeController
                            .text, // apenas esta variável está implementada no momento
                        NomeController.text);
                  },
                  child: const Text('Salvar Alterações'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
