import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tindog_app/app_state.dart';
import 'package:tindog_app/models/petResponse.dart';
import 'package:tindog_app/widget/pet.dart';

class PetPage extends StatefulWidget {
  const PetPage({
    super.key,
    required this.IdTutor,
  });

  final int IdTutor;

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  List<PetResponse> pets = [];

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
    return ListView.builder(
      itemCount: pets.length,
      itemBuilder: (context, index) {
        final pet = pets[index];
        return Column(
          children: [
            if (index == 0)
              SizedBox(
                height: 15,
              ),
            Pet(
              nome: pet.nome,
              idade: calcularIdade(pet.dataNascimento),
              urlImagem:
                  'https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2024/07/03/79816500-shih-tzu.jpg',
            ),
            if (index != pets.length - 1) Divider(color: Colors.black),
          ],
        );
      },
    );
  }
}
