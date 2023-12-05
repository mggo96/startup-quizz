import 'dart:convert';

import 'package:flutter/services.dart';

class Quizz {
  late String categorie;
  late String question;
  late List<String> reponse;
  late String bonne_reponse;

  Quizz(this.categorie, this.question, this.reponse, this.bonne_reponse);

  static Future<List<dynamic>> chargerDonnees() async {
    String jsonString = await rootBundle.loadString('assets/quizz_data.json');
    return json.decode(jsonString);
  }

  static Future<List<Quizz>?> convertirJson() async {
    final jsonData = await chargerDonnees();
    // Déclare une liste vide pour les objets Quizz
    late List<Quizz> listQuizz = [];
// creer a partir de ça un objet quizz(list[1])
    for (int i = 0; i < listQuizz.length; i++) {
      jsonData[i]
    }
    return null;
    // Ici, il faudrait ajouter une boucle pour parcourir jsonData,
    // créer des objets Quizz et les ajouter à listQuizz
  }
}
