import 'package:flutter/material.dart';

import 'insertJson.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.title});

  final String title;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<Quizz>? monQuizz;

  String? _selectedAnswer;

  @override
  void initState() {
    super.initState();
    chargerQuizz();
  }

  Future<void> chargerQuizz() async {
    List<Quizz> quizList =
        await Quizz.convertirJson(); // Récupère une liste de Quizz

    setState(() {
      monQuizz = quizList;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (monQuizz == null || monQuizz!.isEmpty) {
      // Si c'est le cas, retourne un Scaffold (un layout de base dans Flutter)
      return Scaffold(
        appBar: AppBar(
          title: Text('Démarrage Quizz'),
        ),
        // Affiche un indicateur de chargement au centre de l'écran
        body: Center(child: CircularProgressIndicator()),
      );
    }

    Quizz currentQuizz = monQuizz![2];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("histoire des startup"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Card(
                child: Text(
                  currentQuizz.question,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(height: 100),
            const RadioListTileDemo(),
          ],
        ),
      ),
    );
  }
}

class RadioListTileDemo extends StatefulWidget {
  const RadioListTileDemo({super.key});

  @override
  _RadioListTileDemoState createState() => _RadioListTileDemoState();
}

class _RadioListTileDemoState extends State<RadioListTileDemo> {
  String _selectedOption = 'reponse_un';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: RadioListTile<String>(
            title: const Text('reponse 5'),
            value: 'reponse 5',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
          ),
        ),
        RadioListTile<String>(
          title: const Text('reponse 2'),
          value: 'reponse 2',
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('reponse 3'),
          value: 'reponse 3',
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value!;
            });
          },
        ),
      ],
    );
  }
}
