class Alimento {
  final int id;
  final String nome;
  final DateTime validade;
  final int quantidade;
  final String categoria;

  Alimento({
    required this.id,
    required this.nome,
    required this.validade,
    required this.quantidade,
    required this.categoria,
  });

  Map<String, dynamic> toMap(){
    return {
    'id': id,
    'nome': nome,
    'validade': validade.toIso8601String(),
    'quantidade': quantidade,
    'categoria': categoria
    };
  }
  factory Alimento.fromMap(Map<String, dynamic> map) {
  return Alimento(
    id: map['id'],
    nome: map['nome'],
    validade: DateTime.parse(map['validade']),
    quantidade: map['quantidade'],
    categoria: map['categoria'],
  );
}

}
