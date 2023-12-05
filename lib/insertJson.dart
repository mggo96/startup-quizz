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
    List<dynamic> list_map = json.decode(jsonString);
    return list_map;
  }
}
