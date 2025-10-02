class Orcamento {
  String name;
  String tipoDeServico;
  String material;
  int quantidade;
  String observacoes;

  Orcamento({
    required this.name,
    required this.tipoDeServico,
    required this.material,
    required this.quantidade,
    required this.observacoes,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'tipoDeServico': tipoDeServico,
      'material': material,
      'quantidade': quantidade,
      'observacoes': observacoes,
    };
  }

  factory Orcamento.fromMap(Map<String, dynamic> map) {
    return Orcamento(
      name: map['name']!.toString(),
      tipoDeServico: map['tipoDeServico']!.toString(),
      material: map['material']!.toString(),
      quantidade: map['quantidade']!.toInt(),
      observacoes: map['observacoes']!.toString(),
    );
  }
}
