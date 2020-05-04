import 'package:flutter/material.dart';
import 'package:todo_list/models/tarefa.dart';

class CadastrarPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  Tarefa tarefa = new Tarefa();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Tarefa',
                hintText: 'Digite a tarefa',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'O campo tarefa é obrigatório';
                }
                return null;
              },
              onSaved: (value) {
                tarefa.nome = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Descrição',
                hintText: 'Digite a descrição da tarefa',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'O campo descrição é obrigatório';
                }
                return null;
              },
              onSaved: (value) {
                tarefa.descricao = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 100,
              child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.pop(context, tarefa);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
