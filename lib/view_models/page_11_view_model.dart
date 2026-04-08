import 'package:flutter/material.dart';
import '../models/faq_model.dart';

class Page11ViewModel extends ChangeNotifier {
  final List<FAQItem> _allFaqs = [
    FAQItem(
      category: "Inscriptions",
      question: "Comment s'inscrire à l'université ?",
      answer: "Les inscriptions se font généralement en ligne sur le site du Ministère de l'Enseignement Supérieur (orientationsup.net). Tu auras besoin de :\n\n• Ton attestation du BAC\n• Une copie de ta CNI\n• Un extrait de naissance\n• Des photos d'identité",
    ),
    FAQItem(
      category: "Filières",
      question: "Quelle est la différence entre A1 et A2 ?",
      answer: "La série A1 est plus axée sur les langues et la littérature, tandis que la A2 met un accent plus prononcé sur les sciences sociales et l'histoire-géo.",
    ),
    FAQItem(
      category: "Bourses",
      question: "Comment obtenir une bourse d'étude ?",
      answer: "Les bourses sont attribuées sur critères sociaux et d'excellence académique. Il faut déposer un dossier à la DOB (Direction de l'Orientation et des Bourses) après les résultats du BAC ou en cours de cycle.",
    ),
    FAQItem(
      category: "Filières",
      question: "Quelles sont les débouchés de la série S ?",
      answer: "La série S (Scientifique) ouvre les portes de la médecine, de l'ingénierie, de l'informatique, de l'architecture et de toutes les carrières scientifiques de haut niveau.",
    ),
    FAQItem(
      category: "Vie étudiante",
      question: "Où se loger à l'université ?",
      answer: "Le CROU (Centre Régional des Œuvres Universitaires) gère les cités universitaires. Il faut faire une demande d'attribution de lit en début d'année universitaire via leur plateforme dédiée.",
    ),
    FAQItem(
      category: "Admissions",
      question: "C'est quoi un concours d'entrée ?",
      answer: "Certaines grandes écoles (INPHB, ENS, ENSEA) recrutent sur concours. Cela signifie qu'il y a un examen écrit et parfois oral, et seuls les meilleurs sont admis selon le nombre de places disponibles.",
    ),
    FAQItem(
      category: "Filières",
      question: "Qu'est-ce que le système LMD ?",
      answer: "LMD signifie Licence (3 ans), Master (2 ans), Doctorat (3 ans). C'est le système de diplômes reconnu internationalement et utilisé dans toutes les universités de Côte d'Ivoire.",
    ),
    FAQItem(
      category: "Inscriptions",
      question: "Quelles sont les grandes écoles publiques en CI ?",
      answer: "Parmi les plus célèbres : l'INPHB (Yamoussoukro), l'ENS (Éducation), l'INFAS (Santé), l'ENA (Administration) et les Universités publiques (FHB Cocody, Nangui Abrogoua, Alassane Ouattara, etc.).",
    ),
    FAQItem(
      category: "Filières",
      question: "Peut-on changer de filière après la L1 ?",
      answer: "Oui, c'est ce qu'on appelle une réorientation. Elle est possible sous certaines conditions de notes et de places disponibles dans la nouvelle filière demandée.",
    ),
    FAQItem(
      category: "Admissions",
      question: "Comment se passe l'orientation après la 3ème ?",
      answer: "Après le BEPC, les élèves sont orientés soit en Seconde (A ou C) en fonction de leurs moyennes annuelles et de leurs notes à l'examen, soit vers l'enseignement technique et professionnel (Lycées techniques).",
    ),
    FAQItem(
      category: "Bourses",
      question: "Existe-t-il des bourses pour étudier à l'étranger ?",
      answer: "Oui, le gouvernement ivoirien propose des bourses hors-Côte d'Ivoire pour les meilleurs bacheliers (Mentions Bien ou Très Bien) pour des filières spécifiques non disponibles sur place.",
    ),
    FAQItem(
      category: "Bourses",
      question: "Un élève du privé peut-il avoir une bourse ?",
      answer: "Oui, les élèves affectés par l'État dans les établissements privés peuvent également postuler aux bourses de secours ou d'étude sous certaines conditions de revenus parentaux.",
    ),
    FAQItem(
      category: "Bourses",
      question: "Comment renouveler ma bourse chaque année ?",
      answer: "Le renouvellement n'est pas automatique. Tu dois fournir chaque année tes résultats scolaires et un certificat de scolarité à la Direction de l'Orientation et des Bourses (DOB).",
    ),
    FAQItem(
      category: "Bourses",
      question: "C'est quoi la bourse de secours ?",
      answer: "C'est une aide financière destinée aux élèves dont les parents ont des revenus très modestes. Elle aide à couvrir les frais de fournitures et de transport.",
    ),
    FAQItem(
      category: "BEPC",
      question: "Comment se fait l'inscription au BEPC ?",
      answer: "L'inscription est gérée par la DECO. Pour les candidats officiels, l'établissement s'en charge. Tu dois fournir un extrait de naissance original, des photos d'identité et payer les droits d'examen via TresorMoney ou Mobile Money.",
    ),
    FAQItem(
      category: "BEPC",
      question: "Quels sont les critères pour passer en Seconde ?",
      answer: "Le passage en seconde dépend de ta Moyenne d'Orientation (MO). Elle est calculée en combinant tes notes de classe de l'année et tes notes obtenues à l'examen du BEPC (Maths, Français, Physique-Chimie, Anglais).",
    ),
    FAQItem(
      category: "BEPC",
      question: "Peut-on aller au Lycée Technique après la 3ème ?",
      answer: "Oui, si tu as de bonnes notes en Mathématiques et en Physique, tu peux demander une orientation en Seconde AB ou T (Lycées Techniques) pour préparer un BAC technique (G1, G2, F, etc.).",
    ),
    FAQItem(
      category: "Vie étudiante",
      question: "Qu'est-ce que la carte d'étudiant multiservices ?",
      answer: "C'est ta pièce d'identité à l'université. Elle permet d'accéder aux bibliothèques, aux restaurants universitaires, et de bénéficier de réductions dans les bus SOTRA.",
    ),
  ];

  String _searchQuery = "";
  String _selectedCategory = "Toutes";

  List<String> get categories => ["Toutes", "BEPC", "Filières", "Inscriptions", "Bourses", "Vie étudiante", "Admissions"];
  String get selectedCategory => _selectedCategory;

  List<FAQItem> get filteredFaqs {
    return _allFaqs.where((faq) {
      final matchesSearch = faq.question.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                            faq.answer.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == "Toutes" || faq.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
