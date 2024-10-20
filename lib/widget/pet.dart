import 'package:flutter/material.dart';

class Pet extends StatefulWidget {
  const Pet(
      {super.key,
      required this.nome,
      required this.idade,
      required this.urlImagem});

  final String? nome;
  final int idade;
  final String? urlImagem;

  @override
  State<Pet> createState() => _PetState();
}

class _PetState extends State<Pet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.nome}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '${widget.idade} anos',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            width: 500,
            child: Image.network(
              '${widget.urlImagem}',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
