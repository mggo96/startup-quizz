import 'package:flutter/material.dart';

import 'insertJson.dart';

class Question extends StatefulWidget {
  final String titreCategorie;
  Question({super.key, required this.titreCategorie});

  @override
  State<Question> createState() =>
      _QuestionState(titreCategorie: titreCategorie);
}

class _QuestionState extends State<Question> {
  final String titreCategorie;
  List<Quizz>? monQuizz;
  String _selectedOption = 'reponse_un';
  String? _selectedAnswer;

  _QuestionState({required this.titreCategorie});

  @override
  void initState() {
    super.initState();
    chargerQuizz();
  }

  Future<void> chargerQuizz() async {
    List<Quizz> quizList = await Quizz.convertirJson();
    setState(() {
      monQuizz =
          quizList.where((quizz) => quizz.categorie == titreCategorie).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (monQuizz == null || monQuizz!.isEmpty) {
      // Si c'est le cas, retourne un Scaffold (un layout de base dans Flutter)
      return Scaffold(
        appBar: AppBar(
          title: const Text('Démarrage Quizz'),
        ),
        // Affiche un indicateur de chargement au centre de l'écran
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    int i = 0;
    Quizz currentQuizz = monQuizz![i];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(currentQuizz.categorie),
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
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: RadioListTile<String>(
                    title: Text(currentQuizz.reponse[0]),
                    value: currentQuizz.reponse[0],
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                ),
                RadioListTile<String>(
                  title: Text(currentQuizz.reponse[1]),
                  value: currentQuizz.reponse[1],
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text(currentQuizz.reponse[2]),
                  value: currentQuizz.reponse[2],
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
