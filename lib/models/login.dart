class LoginRequest {
  final String email;
  final String senha;

  LoginRequest({required this.email, required this.senha});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'senha': senha,
    };
  }
}

class LoginResponse {
  final int id;
  final String mensagem;

  LoginResponse({this.id = 0, required this.mensagem});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    int id_aux = 0;
    if (json.containsKey('id')) {
      id_aux = json['id'];
    }
    return LoginResponse(
      id: id_aux,
      mensagem: json['mensagem'],
    );
  }
}
