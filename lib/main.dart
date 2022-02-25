// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questao.dart';
import './resposta.dart';
import 'resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
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

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;
    List<Widget> widgets =
        respostas.map((t) => Resposta(t, _responder)).toList();

    // for (var textoResp in respostas) {
    //   respostas.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Column(
                  children: <Widget>[
                    Questao(_perguntas[_perguntaSelecionada]['texto']),
                    ...respostas.map((t) => Resposta(t, _responder)).toList(),
                  ],
                )
              : Resultado()),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
