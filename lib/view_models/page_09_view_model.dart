import 'package:flutter/material.dart';
import '../models/orientation_models.dart';
import '../services/database_service.dart';

class Page09ViewModel extends ChangeNotifier {
  StudentLevel _level = StudentLevel.bepc;
  int _currentIndex = 0;
  final Map<String, double> _scores = {};
  final DatabaseService _dbService = DatabaseService();

  StudentLevel get level => _level;
  int get currentIndex => _currentIndex;

  void setLevel(StudentLevel newLevel) { //change le niveau et met le quiz à zéro
    _level = newLevel;
    _currentIndex = 0;
    _scores.clear();
    notifyListeners();
  }

  void toggleLevel() { //bascule entre bepc et bac
    _level = (_level == StudentLevel.bepc) ? StudentLevel.bac : StudentLevel.bepc;
    _currentIndex = 0;
    _scores.clear();
    notifyListeners();
  }

  List<Question> get questions => _level == StudentLevel.bepc ? _bepcQuestions : _bacQuestions;
  Question get currentQuestion => questions[_currentIndex];
  double get progress => (_currentIndex + 1) / questions.length;
  String get progressPercent => "${((_currentIndex + 1) / questions.length * 100).toInt()}%";

  void answer(Option option) {
    option.scores.forEach((k, v) => _scores[k] = (_scores[k] ?? 0) + v);
    if (_currentIndex < questions.length - 1) {
      _currentIndex++;
      notifyListeners();
    } else
    {
      _finishTest();
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  Future<void> _finishTest() async {
    await _dbService.saveResult(_level, _scores);
    print("Test terminé et sauvegardé localement !");
  }

  final List<Question> _bepcQuestions = [
    Question(text: "Ta matière préférée au collège ?", hint: "Choisis celle où tu t'épanouis le plus.", options: [
      Option(text: "Mathématiques", icon: "📐", scores: {"S": 1}),
      Option(text: "Français", icon: "📚", scores: {"A": 1}),
      Option(text: "SVT", icon: "🌿", scores: {"C": 1}),
      Option(text: "Anglais", icon: "🇺🇸", scores: {"A": 0.5, "Comm": 0.5}),
      Option(text: "Arts Plastiques", icon: "🎨", scores: {"Art": 1}),
    ]),
    Question(text: "Comment aimes-tu passer ton temps libre ?", hint: "Tes passions révèlent tes talents.", options: [
      Option(text: "Lire ou écrire des histoires", icon: "📖", scores: {"A": 1}),
      Option(text: "Faire des calculs ou des jeux de logique", icon: "🧮", scores: {"S": 1}),
      Option(text: "Bricoler ou réparer des objets", icon: "🛠️", scores: {"Tec": 1}),
      Option(text: "Aider tes amis dans leurs devoirs", icon: "🤝", scores: {"Soc": 1}),
      Option(text: "Utiliser l'ordinateur ou jouer", icon: "🎮", scores: {"IT": 1}),
    ]),
    Question(text: "Quel environnement t'attire le plus ?", hint: "Où te sens-tu le plus à l'aise ?", options: [
      Option(text: "Un laboratoire scientifique", icon: "🧪", scores: {"Sci": 1}),
      Option(text: "Un tribunal ou un bureau", icon: "⚖️", scores: {"Law": 1}),
      Option(text: "En plein air et dans la nature", icon: "🌳", scores: {"Agri": 1}),
      Option(text: "Un studio de création", icon: "🎨", scores: {"Art": 1}),
      Option(text: "Une salle de sport", icon: "⚽", scores: {"Sport": 1}),
    ]),
    Question(text: "Face à une machine en panne, tu...", hint: "Ta réaction face à la technique.", options: [
      Option(text: "Cherches à comprendre pourquoi", icon: "🧐", scores: {"S": 1}),
      Option(text: "Prends des outils pour l'ouvrir", icon: "🔧", scores: {"Tec": 1}),
      Option(text: "Lis le manuel d'utilisation", icon: "📖", scores: {"A": 1}),
      Option(text: "Appelles un expert", icon: "📞", scores: {"Soc": 1}),
      Option(text: "En achètes une nouvelle", icon: "🛒", scores: {"Eco": 1}),
    ]),
    Question(text: "Quelle est ta plus grande qualité ?", hint: "Demande à tes proches si besoin.", options: [
      Option(text: "La précision", icon: "📏", scores: {"S": 1}),
      Option(text: "L'imagination", icon: "💡", scores: {"Art": 1}),
      Option(text: "La générosité", icon: "❤️", scores: {"Soc": 1}),
      Option(text: "La curiosité", icon: "🔍", scores: {"Sci": 1}),
      Option(text: "La patience", icon: "⏳", scores: {"Soc": 0.5, "Edu": 0.5}),
    ]),
    Question(text: "Aimes-tu les animaux ?", hint: "Le contact avec le vivant.", options: [
      Option(text: "J'adore m'en occuper", icon: "🐾", scores: {"Vet": 1}),
      Option(text: "J'aime les observer", icon: "🔭", scores: {"Bio": 1}),
      Option(text: "C'est sympa mais de loin", icon: "🐈", scores: {"Nat": 1}),
      Option(text: "Je préfère les plantes", icon: "🌻", scores: {"Agri": 1}),
      Option(text: "Pas particulièrement", icon: "🏙️", scores: {"Other": 1}),
    ]),
    Question(text: "Quel type de films préfères-tu ?", hint: "Tes goûts cinématographiques.", options: [
      Option(text: "Documentaires scientifiques", icon: "🎥", scores: {"Sci": 1}),
      Option(text: "Drames et histoires humaines", icon: "🎭", scores: {"Lit": 1}),
      Option(text: "Action et technologie", icon: "🚀", scores: {"IT": 1}),
      Option(text: "Films policiers / Enquêtes", icon: "🕵️", scores: {"Law": 1}),
      Option(text: "Dessins animés / Animation", icon: "🎨", scores: {"Art": 1}),
    ]),
    Question(text: "Comment gères-tu ton argent ?", hint: "Tes premières habitudes financières.", options: [
      Option(text: "Je l'économise précieusement", icon: "💰", scores: {"Eco": 1}),
      Option(text: "Je l'utilise pour mes projets", icon: "🚀", scores: {"Mngt": 1}),
      Option(text: "J'achète des livres ou jeux", icon: "🛍️", scores: {"A": 0.5, "IT": 0.5}),
      Option(text: "Je fais des cadeaux", icon: "🎁", scores: {"Soc": 1}),
      Option(text: "Je dépense sans compter", icon: "📉", scores: {"Other": 1}),
    ]),
    Question(text: "Aimes-tu parler en public ?", hint: "Ton aisance à l'oral.", options: [
      Option(text: "J'adore convaincre", icon: "⚖️", scores: {"Law": 1}),
      Option(text: "J'aime raconter des choses", icon: "🗣️", scores: {"Comm": 1}),
      Option(text: "Ça me dérange un peu", icon: "🤐", scores: {"Research": 1}),
      Option(text: "Seulement avec mes amis", icon: "👥", scores: {"Soc": 1}),
      Option(text: "Pas du tout", icon: "🤫", scores: {"Other": 1}),
    ]),
    Question(text: "Quel objet emmènerais-tu sur une île ?", hint: "Ton essentiel.", options: [
      Option(text: "Une boussole / Outils", icon: "🧭", scores: {"Tec": 1}),
      Option(text: "Un carnet et un stylo", icon: "📝", scores: {"Lit": 1}),
      Option(text: "Une trousse de secours", icon: "🏥", scores: {"Med": 1}),
      Option(text: "Un ordinateur solaire", icon: "💻", scores: {"IT": 1}),
      Option(text: "Un instrument de musique", icon: "🎸", scores: {"Art": 1}),
    ]),
  ];

  final List<Question> _bacQuestions = [
    Question(text: "Quel domaine universitaire t'attire ?", hint: "Ton futur post-BAC.", options: [
      Option(text: "Médecine / Pharmacie", icon: "🏥", scores: {"Med": 1}),
      Option(text: "Droit / Sc. Politiques", icon: "🏛️", scores: {"Law": 1}),
      Option(text: "Ingénierie / Tech", icon: "🤖", scores: {"IT": 1}),
      Option(text: "Économie / Gestion", icon: "📊", scores: {"Eco": 1}),
      Option(text: "Arts / Design", icon: "🎨", scores: {"Art": 1}),
    ]),
    Question(text: "Quelle est ta motivation principale ?", hint: "Pourquoi veux-tu réussir ?", options: [
      Option(text: "Innover techniquement", icon: "🚀", scores: {"IT": 1}),
      Option(text: "Rendre le monde plus juste", icon: "⚖️", scores: {"Law": 1}),
      Option(text: "Soigner et aider", icon: "❤️", scores: {"Med": 1}),
      Option(text: "Devenir un grand dirigeant", icon: "💼", scores: {"Mngt": 1}),
      Option(text: "S'exprimer librement", icon: "🎭", scores: {"Art": 1}),
    ]),
    Question(text: "Comment préfères-tu travailler ?", hint: "Ton mode de fonctionnement.", options: [
      Option(text: "Seul en profondeur", icon: "🧘", scores: {"Sci": 1}),
      Option(text: "En équipe projet", icon: "👥", scores: {"Mngt": 1}),
      Option(text: "En contact avec le public", icon: "📢", scores: {"Comm": 1}),
      Option(text: "Sur le terrain", icon: "🏃", scores: {"Eng": 1}),
      Option(text: "À distance / Digital", icon: "💻", scores: {"IT": 1}),
    ]),
    Question(text: "Quel type de lecture t'intéresse ?", hint: "Ta curiosité intellectuelle.", options: [
      Option(text: "Revues scientifiques", icon: "🔬", scores: {"Sci": 1}),
      Option(text: "Essais politiques", icon: "📜", scores: {"Law": 1}),
      Option(text: "Actualité économique", icon: "📰", scores: {"Eco": 1}),
      Option(text: "Romans et littérature", icon: "📖", scores: {"Lit": 1}),
      Option(text: "BD et Graphisme", icon: "🎨", scores: {"Art": 1}),
    ]),
    Question(text: "Face au stress des examens, tu...", hint: "Ta gestion des émotions.", options: [
      Option(text: "Organises tout à la lettre", icon: "📅", scores: {"Admin": 1}),
      Option(text: "Restes calme et confiant", icon: "😌", scores: {"Psy": 1}),
      Option(text: "Travailles sans relâche", icon: "✍️", scores: {"S": 1}),
      Option(text: "En parles avec tes proches", icon: "🗣️", scores: {"Soc": 1}),
      Option(text: "Fais du sport pour évacuer", icon: "⚽", scores: {"Sport": 1}),
    ]),
    Question(text: "Travailler à l'international ?", hint: "Ta vision du futur géographique.", options: [
      Option(text: "C'est mon objectif principal", icon: "🌍", scores: {"Lang": 1}),
      Option(text: "Seulement si c'est nécessaire", icon: "📍", scores: {"Local": 1}),
      Option(text: "Je préfère rester en CI", icon: "🇨🇮", scores: {"Local": 1}),
      Option(text: "Travailler en voyageant", icon: "✈️", scores: {"Tour": 1}),
      Option(text: "Peu importe l'endroit", icon: "🗺️", scores: {"Other": 1}),
    ]),
    Question(text: "Quel secteur te passionne ?", hint: "L'industrie de ton choix.", options: [
      Option(text: "Intelligence Artificielle", icon: "🤖", scores: {"IT": 1}),
      Option(text: "Énergies Renouvelables", icon: "☀️", scores: {"Sci": 1}),
      Option(text: "Finance et Bourse", icon: "📈", scores: {"Eco": 1}),
      Option(text: "Cinéma et Médias", icon: "🎬", scores: {"Art": 1}),
      Option(text: "Agriculture moderne", icon: "🚜", scores: {"Agri": 1}),
    ]),
    Question(text: "Ton rôle dans un groupe ?", hint: "Ta position sociale.", options: [
      Option(text: "Le leader décisionnaire", icon: "👑", scores: {"Mngt": 1}),
      Option(text: "L'expert technique", icon: "🧐", scores: {"Sci": 1}),
      Option(text: "Le médiateur", icon: "🤝", scores: {"Soc": 1}),
      Option(text: "Le créatif visionnaire", icon: "💡", scores: {"Art": 1}),
      Option(text: "L'organisateur rigoureux", icon: "📋", scores: {"Admin": 1}),
    ]),
    Question(text: "Aimes-tu les responsabilités ?", hint: "Prendre des décisions.", options: [
      Option(text: "J'en ai besoin", icon: "🚀", scores: {"Law": 1}),
      Option(text: "Je les accepte bien", icon: "👌", scores: {"Mngt": 1}),
      Option(text: "Je préfère être guidé", icon: "🧭", scores: {"Other": 1}),
      Option(text: "Seulement si je maîtrise", icon: "⚖️", scores: {"S": 1}),
      Option(text: "Ça me stresse trop", icon: "😟", scores: {"Other": 1}),
    ]),
    Question(text: "Quelle technologie t'impressionne ?", hint: "L'innovation du futur.", options: [
      Option(text: "La biotechnologie", icon: "🧬", scores: {"Med": 1}),
      Option(text: "L'exploration spatiale", icon: "🚀", scores: {"Sci": 1}),
      Option(text: "La blockchain", icon: "⛓️", scores: {"Eco": 1}),
      Option(text: "La réalité virtuelle", icon: "👓", scores: {"Art": 1}),
      Option(text: "Le big data", icon: "📊", scores: {"IT": 1}),
    ]),
    Question(text: "Ton rapport avec les langues ?", hint: "Communication mondiale.", options: [
      Option(text: "J'en parle au moins trois", icon: "🗣️", scores: {"Lang": 1}),
      Option(text: "L'anglais me suffit", icon: "🇺🇸", scores: {"IT": 1}),
      Option(text: "Je préfère ma langue", icon: "🇨🇮", scores: {"Local": 1}),
      Option(text: "Le code est ma langue", icon: "💻", scores: {"IT": 1}),
      Option(text: "C'est un défi pour moi", icon: "📉", scores: {"Other": 1}),
    ]),
    Question(text: "Quelle cause défendrais-tu ?", hint: "Tes valeurs profondes.", options: [
      Option(text: "L'accès à la santé", icon: "🏥", scores: {"Med": 1}),
      Option(text: "L'égalité des chances", icon: "⚖️", scores: {"Law": 1}),
      Option(text: "La protection du climat", icon: "🌡️", scores: {"Sci": 1}),
      Option(text: "Le développement digital", icon: "📱", scores: {"IT": 1}),
      Option(text: "La culture pour tous", icon: "🎨", scores: {"Art": 1}),
    ]),
    Question(text: "Si tu devais créer une entreprise ?", hint: "Ton esprit entrepreneurial.", options: [
      Option(text: "Une startup tech", icon: "🦄", scores: {"IT": 1}),
      Option(text: "Un cabinet d'avocats", icon: "🏛️", scores: {"Law": 1}),
      Option(text: "Une clinique moderne", icon: "🏥", scores: {"Med": 1}),
      Option(text: "Une agence de design", icon: "🎨", scores: {"Art": 1}),
      Option(text: "Une ferme agro-tech", icon: "🚜", scores: {"Agri": 1}),
    ]),
    Question(text: "Ton diplôme idéal ?", hint: "Ton ambition académique.", options: [
      Option(text: "Master d'excellence", icon: "🎓", scores: {"Sci": 1}),
      Option(text: "Doctorat en recherche", icon: "👨‍🏫", scores: {"Research": 1}),
      Option(text: "Diplôme d'ingénieur", icon: "👷", scores: {"Eng": 1}),
      Option(text: "MBA / Business School", icon: "💼", scores: {"Eco": 1}),
      Option(text: "École d'Art prestigieuse", icon: "🎭", scores: {"Art": 1}),
    ]),
    Question(text: "Vision du succès final ?", hint: "Ton but ultime.", options: [
      Option(text: "Être riche et influent", icon: "💰", scores: {"Eco": 1}),
      Option(text: "Avoir un impact social", icon: "🌍", scores: {"Soc": 1}),
      Option(text: "Être un expert reconnu", icon: "🎖️", scores: {"Sci": 1}),
      Option(text: "Vivre de ma passion", icon: "✨", scores: {"Art": 1}),
      Option(text: "Avoir une vie équilibrée", icon: "🏡", scores: {"Other": 1}),
    ]),
  ];
}
