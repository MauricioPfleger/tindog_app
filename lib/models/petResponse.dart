class PetResponse {
  final int id;
  final String? nome;
  final String? raca;
  final DateTime dataNascimento;
  final double peso;
  final String? genero;
  final int qtdVacinas;
  final bool pedigree;

  // Construtor posicional
  PetResponse(
    this.id,
    this.nome,
    this.raca,
    this.dataNascimento,
    this.peso,
    this.genero,
    this.qtdVacinas,
    this.pedigree,
  );

  // Fábrica para converter JSON em um objeto PetResponse
  factory PetResponse.fromJson(Map<String, dynamic> json) {
    return PetResponse(
      json['id'],
      json['nome'],
      json['raca'],
      DateTime.parse(json['dataNascimento']),
      json['peso'].toDouble(),
      json['genero'],
      json['qtdVacinas'],
      json['pedigree'],
    );
  }
}
