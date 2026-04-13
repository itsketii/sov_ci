enum StudentLevel { bepc, bac }
//le model ne contient aucune logique ,juste des variables .ild définissent les objets que l'application manipule
enum ApplicationStatus { enPrepa, depose, enAttente, accepte }

class Establishment {
  final String id;
  final String name;
  final String type;
  final String location;
  final String fees;
  final String field; // Filière sélectionnée soit pour le bepc soit pour le bac
  final int totalFields;
  final int reputation; // 1 à 5 étoiles
  final String insertionRate;
  ApplicationStatus status;
  bool isSelected; // Pour la comparaison des différentes écoles

  Establishment({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.fees,
    required this.field,
    required this.totalFields,
    required this.reputation,
    required this.insertionRate,
    this.status = ApplicationStatus.enPrepa,
    this.isSelected = false,
  });
}

class Question {
  final String text;
  final String hint;
  final List<Option> options;

  Question({required this.text, required this.hint, required this.options});
}

class Option {
  final String text;
  final String icon;
  final Map<String, double> scores;

  Option({required this.text, required this.icon, required this.scores});
}
