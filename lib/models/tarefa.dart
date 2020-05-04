class Tarefa {
  String nome;
  String descricao;
  bool concluida;

  Tarefa({this.nome, this.descricao, this.concluida});

  Tarefa.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    concluida = json['concluida'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['concluida'] = this.concluida;
    return data;
  }
}