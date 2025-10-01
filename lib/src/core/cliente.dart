class Cliente {
  String name;
  int cpf;
  int telefone;
  String email;
  String endereco;
  int cep;
  String cidade;

  Cliente({
    required this.name,
    required this.cpf,
    required this.telefone,
    required this.email,
    required this.endereco,
    required this.cep,
    required this.cidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cpf': cpf,
      'telefone': telefone,
      'email': email,
      'endereco': endereco,
      'cep': cep,
      'cidade': cidade,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      name: map['name']!.toString(),
      cpf: map['cpf']!.toInt(),
      telefone: map['telefone']!.toInt(),
      email: map['email']!.toString(),
      endereco: map['endereco']!.toString(),
      cep: map['cep']!.toInt(),
      cidade: map['cidade']!.toString(),
    );
  }
}
