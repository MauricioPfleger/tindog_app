class PaisResponse {
  final int id;
  final String? nome;

  // Construtor posicional
  PaisResponse(
    this.id,
    this.nome,
  );

  // Fábrica para converter JSON em um objeto PaisResponse
  factory PaisResponse.fromJson(Map<String, dynamic> json) {
    return PaisResponse(
      json['id'],
      json['nome'],
    );
  }
}
