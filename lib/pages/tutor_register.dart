import 'package:flutter/material.dart';

class TutorRegister extends StatefulWidget {
  const TutorRegister({super.key});

  @override
  State<TutorRegister> createState() => _TutorRegisterState();
}

class _TutorRegisterState extends State<TutorRegister> {
  String? selectedCountry;

  final List<String> countries = ['Brasil', 'Argentina', 'Estados Unidos'];

  String? selectedEstate;

  final List<String> estates = ['São Paulo', 'Patagônia', 'Califórnia'];

  String? selectedCity;

  final List<String> cities = ['Santos', 'Buenos Aires', 'Nova Iorque'];

  String? selectedGender;

  final List<String> genders = ['Masculino', 'Feminino'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cadastrar Tutor'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
              keyboardType: TextInputType.name,
            ),
             TextField(
              decoration: InputDecoration(labelText: 'Sobrenome'),
              keyboardType: TextInputType.name,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Data de nascimento'),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Telefone'),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Gênero'),
              value: selectedGender,
              items: genders.map((genders) {
                return DropdownMenuItem(
                  value: genders,
                  child: Text(genders),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value as String?;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
             TextField(
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 30,),

            const Text("Endereço"),

            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'País'),
              value: selectedCountry,
              items: countries.map((countries) {
                return DropdownMenuItem(
                  value: countries,
                  child: Text(countries),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value as String?;
                });
              },
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Estado'),
              value: selectedEstate,
              items: estates.map((estates) {
                return DropdownMenuItem(
                  value: estates,
                  child: Text(estates),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedEstate = value as String?;
                });
              },
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Cidade'),
              value: selectedCity,
              items: cities.map((cities) {
                return DropdownMenuItem(
                  value: cities,
                  child: Text(cities),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCity = value as String?;
                });
              },
            ),
             TextField(
              decoration: InputDecoration(labelText: 'Rua'),
              keyboardType: TextInputType.name,
            ),
             TextField(
              decoration: InputDecoration(labelText: 'Número'),
              keyboardType: TextInputType.number,
            ),
             TextField(
              decoration: InputDecoration(labelText: 'Bairro'),
              keyboardType: TextInputType.name,
            ),
             TextField(
              decoration: InputDecoration(labelText: 'CEP'),
              keyboardType: TextInputType.number,
            ),
             TextField(
              decoration: InputDecoration(labelText: 'Complemento'),
              keyboardType: TextInputType.text,
            ),
          
            SizedBox (height: 30,),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Cadastre-se'),
              ),
            )
          ]
        )    
      ) 
    )
    );
  }
}
