// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    //print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual sua cor favorita?',
        'respostas': ['Azul', 'Vermelho', 'Preto', 'Verde'],
      },
      {
        'texto': 'Qual o seu animal favorito?',
        'respostas': ['Cachorro', 'Gato', 'Peixe', 'Tartaruga'],
      },
      {
        'texto': 'Qual o seu professor favorito?',
        'respostas': ['Dory', 'Fred', 'Marllos', 'Carlos'],
      },
    ];
    ;
    Object? respostas = perguntas[_perguntaSelecionada]['respostas'];
    List<Widget> widgets = [];

    for (var texto in perguntas[_perguntaSelecionada]['respostas']) {
      respostas.add(Resposta(texto, _responder));
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: Column(
            children: <Widget>[
              Questao(perguntas[_perguntaSelecionada]['texto']),
              ...respostas
            ],
          )),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
