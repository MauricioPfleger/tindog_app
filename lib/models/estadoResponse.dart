class EstadoResponse {
  final int id;
  final String? nome;

  // Construtor posicional
  EstadoResponse(
    this.id,
    this.nome,
  );

  // Fábrica para converter JSON em um objeto EstadoResponse
  factory EstadoResponse.fromJson(Map<String, dynamic> json) {
    return EstadoResponse(
      json['id'],
      json['nome'],
    );
  }
}
