import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tindog_app/models/estadoResponse.dart';
import 'package:tindog_app/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tindog_app/models/paisResponse.dart';
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

  Future<List<PaisResponse>?>? BuscarPaises() async {
    // Guardar a rota do endpoint em uma variável
    final url = Uri.parse('http://localhost:5115/Local/v1/lista-paises');

    // Utilizando try, para caso aconteça algum problema no nosso código
    // podermos apresentar uma mensagem de erro em tela
    // essa mensagem é definida lá em baixo, na seção catch
    try {
      // Nessa parte de código, estamos executando de fato a API
      // e guaradando o resultado da mesma na variável response
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Nesta parte, testamos se nossa API executou com sucesso (200)
      if (response.statusCode == 200) {
        // É armazendo o retorno da api contido no body, para a variável
        // data, mas este valor já estamos decodificado para um objeto de JSON
        // response.body = [{"id": 1, "nome": "Argentina"}, {"id": 2, "nome": "Brasil"}]
        // data = List<dynamic>
        final data = jsonDecode(response.body);

        // Aqui convertemos a List<dynamic> pata List<PaisResponse>
        final List<PaisResponse> paises = (data as List<dynamic>)
            .map((json) => PaisResponse.fromJson(json))
            .toList();

        // Por fim, terminamos a execução retornando os paises
        return paises;
      } else {
        // Caso o retorno da api seja diferente de 200
        // Apresentamos uma pequena mensagem informando que ocorreu o erro
        Fluttertoast.showToast(
          msg: "Ocorreu um erro inesperado",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          textColor: Colors.white,
          fontSize: 16.0,
        );

        // E por fim, não retornamos nenhuma informação
        return null;
      }
    } catch (e) {
      // Apresentamos uma mensagem caso aconteça algum erro de código no nosso método
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

    // Atualizamos a tela
    notifyListeners();
    return null;
  }

  Future<List<EstadoResponse>?>? BuscarEstados(int idPais) async {
    var baseUrl = Uri.parse(
        'http://localhost:5115/Local/v1/lista-estados?idPais=$idPais');
    //var params = {'idPais': idPais};
    //final url = baseUrl.replace(queryParameters: params);

    try {
      final response = await http.get(
        baseUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List<EstadoResponse> estados = (data as List<dynamic>)
            .map((json) => EstadoResponse.fromJson(json))
            .toList();

        return estados;
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
