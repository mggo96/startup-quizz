import 'package:flutter/material.dart';
import 'package:startup_quizz/question.dart';

class QuizzHome extends StatefulWidget {
  const QuizzHome({super.key, required this.title});

  final String title;

  @override
  State<QuizzHome> createState() => _QuizzHome();
}

class _QuizzHome extends State<QuizzHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("quizz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "bienvenue sur startupQuizz",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              "commençons",
              style: TextStyle(fontSize: 25.0),
            ),
            BoutonCategorie(categorie: "histoire", image: Icons.qr_code),
            BoutonCategorie(categorie: "pas histoire", image: Icons.javascript),
            BoutonCategorie(categorie: "jnfj", image: Icons.radar_sharp),
          ],
        ),
      ),
    );
  }
}

class BoutonCategorie extends StatelessWidget {
  final String categorie;
  final IconData image;

  BoutonCategorie({
    required this.categorie,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.8,
      child: InkWell(
        onTap: () {
          allerALaPage(context);
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                image,
                size: 90.0,
              ),
              Text(categorie, style: const TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}

void allerALaPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => const Question(
              title: '',
            )),
  );
}
