import 'package:flutter/material.dart';
import 'package:startup_quizz/question.dart';

class QuizzHome extends StatefulWidget {
  const QuizzHome({super.key});

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
            BoutonCategorie(
                categorie: "Histoire des Startups", image: Icons.lan),
            BoutonCategorie(
                categorie: "Termes des Startups", image: Icons.maps_home_work),
            BoutonCategorie(
                categorie: "Culture Startup", image: Icons.padding_outlined),
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
          allerALaPage(context, categorie);
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

void allerALaPage(BuildContext context, String categories) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => Question(titreCategorie: categories)),
  );
}
