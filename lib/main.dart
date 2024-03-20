import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: MyHomePage(
    title: 'Contador',
  )));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _mensagem = "Bem-vindo, pode entrar.";
  String _quaseCheio = "";
  int _pessoa = 0;

  void _fluxoPessoas(int delta) {
    setState(() {
      _pessoa += delta;

      if (_pessoa >= 20) {
        _mensagem = "Desculpe, o café está lotado.";
        _quaseCheio = "";
        _pessoa = 20;
      } else if (_pessoa < 10 && _pessoa >= 0 && _pessoa < 20) {
        _mensagem = "Bem-vindo, pode entrar.";
        _quaseCheio = "";
      } else if (_pessoa < 0) {
        _mensagem = "O café está vazio.";
        _pessoa = 0;
      } else if (_pessoa >= 10) {
        _quaseCheio = "O café está quase lotado.\n\n";
      } else {
        _pessoa = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Stack is useful if you want to overlap several children
    return Stack(children: <Widget>[
      Image.asset(
        "imagens/img.jpg",
        fit: BoxFit.cover,
        height: 1000.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Indicador de pessoas no local
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Pessoas aqui: $_pessoa",
              style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  backgroundColor: Color.fromARGB(186, 0, 0, 0),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Botões
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(20)),
                    child: const Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () => _fluxoPessoas(1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(22)),
                    child: const Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                    onPressed: () {
                      _fluxoPessoas(-1);
                    },
                  ),
                ),
              ]),

          Text(
            _mensagem,
            style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                backgroundColor: Color.fromARGB(186, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          Text(
            _quaseCheio,
            style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                backgroundColor: Color.fromARGB(186, 0, 0, 0),
                fontSize: 15,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    ]);
  }
}
