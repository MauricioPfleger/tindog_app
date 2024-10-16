import 'package:flutter/material.dart';

class Pet extends StatefulWidget {
  const Pet(
      {super.key,
      required this.id,
      required this.idade,
      required this.nome,
      required this.urlImagem});

  final int id;
  final String nome;
  final int idade;
  final String urlImagem;

  @override
  State<Pet> createState() => _PetState();
}

class _PetState extends State<Pet> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
