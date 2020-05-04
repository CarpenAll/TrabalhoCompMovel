import 'package:flutter/material.dart';
import 'package:todo_list/models/tarefa.dart';
import 'package:todo_list/pages/cadastrar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  List<Tarefa> tarefas = new List<Tarefa>();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas a Fazer'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: widget.tarefas.length == 0
            ? ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Atenção'),
                subtitle: Text('A lista de tarefas está vazia'),
              )
            : ListView.builder(
                itemCount: widget.tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = widget.tarefas[index];
                  return ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text(
                      tarefa.nome,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(tarefa.descricao),
                    trailing: Checkbox(
                      value: tarefa.concluida,
                      onChanged: (value) {
                        setState(() {
                          tarefa.concluida = value;
                        });
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => adicionarTarefa(),
      ),
    );
  }

  adicionarTarefa() async {
    final Tarefa novaTarefa = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CadastrarPage(),
      ),
    );

    if (novaTarefa != null) {
      Tarefa tarefa = new Tarefa(
          nome: novaTarefa.nome,
          descricao: novaTarefa.descricao,
          concluida: false);

      setState(() {
        widget.tarefas.add(tarefa);
      });
    }
  }
}
