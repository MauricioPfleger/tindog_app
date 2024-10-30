import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tindog_app/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tindog_app/models/petResponse.dart';
import 'package:tindog_app/pages/home.dart';

class AppState extends ChangeNotifier {
  Future<void>? EfetuarLogin(
      BuildContext contextStart, String email, String senha) async {
    final url = Uri.parse('http://172.22.100.86:5115/Tutor/v1/login');
    final loginRequest = LoginRequest(email: email, senha: senha);

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginRequest.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final loginResponse = LoginResponse.fromJson(data);
        Navigator.pushAndRemoveUntil(
          contextStart,
          MaterialPageRoute(
            builder: (context) => HomePage(IdTutor: loginResponse.id),
          ),
          (Route<dynamic> route) => false, // Remove todas as rotas anteriores
        );
        Fluttertoast.showToast(
          msg: loginResponse.mensagem,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else if (response.statusCode == 400) {
        final data = jsonDecode(response.body);
        final loginResponse = LoginResponse.fromJson(data);
        Fluttertoast.showToast(
          msg: loginResponse.mensagem,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Ocorreu um erro inesperado",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Não foi possível conectar ao servidor",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    notifyListeners();
  }

  Future<List<PetResponse>?>? BuscarPets(int idTutor) async {
    final url = Uri.parse('http://172.22.100.86:5115/Tutor/v1/$idTutor/pets');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List<PetResponse> pets = (data as List<dynamic>)
            .map((json) => PetResponse.fromJson(json))
            .toList();

        return pets;
      } else {
        Fluttertoast.showToast(
          msg: "Ocorreu um erro inesperado",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return null;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Não foi possível conectar ao servidor",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    notifyListeners();
    return null;
  }
}
