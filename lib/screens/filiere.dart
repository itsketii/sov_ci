import 'package:flutter/material.dart';


enum Debouche { recherchee, moyenne, saturee }

class Filiere {
  final String nom;
  final String domaine;
  final String duree;
  final String description;
  final String debouches;
  final String salaireMoyen;
  final Debouche debouche;

  Filiere({
    required this.nom,
    required this.domaine,
    required this.duree,
    required this.description,
    required this.debouches,
    required this.salaireMoyen,
    required this.debouche,
  });
}

class FicheFiliere extends StatelessWidget {
  final Filiere filiere;
  const FicheFiliere({super.key, required this.filiere});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF04A447),
        foregroundColor: Colors.white,
        title: Text("Retour"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xFF04A447),
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(filiere.nom,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(filiere.domaine,
                      style: const TextStyle(fontSize: 13, color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_time, color: Colors.green),
              title: Text("Durée"),
              subtitle: Text(filiere.duree),
            ),
            ListTile(
              leading: Icon(Icons.description, color: Colors.green),
              title: Text("Description"),
              subtitle: Text(filiere.description),
            ),
            ListTile(
              leading: Icon(Icons.alt_route, color: Colors.green),
              title: Text("Debouches"),
              subtitle: Text(filiere.debouches),
            ),
            ListTile(
              leading: Icon(Icons.attach_money, color: Colors.green),
              title: Text("Salaire moyen"),
              subtitle: Text(filiere.salaireMoyen),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Filiere> filieres = [
  Filiere(
    nom: "Informatique",
    domaine: "Sciences & Tech",
    duree: "5 ans",
    description: "Formation aux bases de la programmation et des systèmes",
    debouches: "Développeur, Ingénieur réseau, Data analyst, Ingénieur en informatique",
    salaireMoyen: "300 000 FCFA",
    debouche: Debouche.recherchee,
  ),
  Filiere(
    nom: "Droit",
    domaine: "Sciences juridiques",
    duree: "5 ans",
    description: "Étude des lois et institutions juridiques",
    debouches: "Avocat, Magistrat, Notaire",
    salaireMoyen: "250 000 FCFA",
    debouche: Debouche.moyenne,
  ),
  Filiere(
    nom: "Lettres modernes",
    domaine: "Lettres & Arts",
    duree: "3 ans",
    description: "Étude de la langue et littérature française",
    debouches: "Enseignant, Journaliste, Traducteur",
    salaireMoyen: "150 000 FCFA",
    debouche: Debouche.saturee,
  ),
  Filiere(
    nom: "Médecine",
    domaine: "Sciences de la santé",
    duree: "7 ans",
    description: "Formation aux soins médicaux et à la santé publique",
    debouches: "Médecin, Chirurgien, Pharmacien",
    salaireMoyen: "500 000 FCFA",
    debouche: Debouche.recherchee,
  ),
  Filiere(
    nom: "Génie Civil",
    domaine: "Batiment",
    duree: "3 ans",
    description: "Formation sur la construction et la gestion des bâtiments",
    debouches: "Ingénieur civil, architecte, ingénieur industriel",
    salaireMoyen: "200 000 FCFA",
    debouche: Debouche.moyenne,
  ),
  Filiere(
    nom: "Commerce",
    domaine: "Buisness",
    duree: "5 ans",
    description: "Formation sur la vente et la gestion des commerces",
    debouches: "Vendeur, Gestionnaire de commerce, Marketing",
    salaireMoyen: "350 000 FCFA",
    debouche: Debouche.saturee,
  ),
  Filiere(
    nom: "Agriculture",
    domaine: "Sciences agronomiques",
    duree: "3 ans",
    description: "Formation à la gestion des cultures et élevages",
    debouches: "Agronome, Ingénieur agricole, Consultant rural",
    salaireMoyen: "180 000 FCFA",
    debouche: Debouche.recherchee,
  ),
  Filiere(
    nom: "Finance & Comptabilité",
    domaine: "Economie & Finance",
    duree: "3 ans",
    description: "Gestion des ressources financières et comptables",
    debouches: "Comptable, Auditeur, Analyste financier",
    salaireMoyen: "400 000 FCFA",
    debouche: Debouche.moyenne,
  ),
  Filiere(
    nom: "Communication",
    domaine: "Journalisme & Medias",
    duree: "3 ans",
    description: "Formation aux techniques de communication et médias",
    debouches: "Journaliste, Chargé de communication, Community manager",
    salaireMoyen: "200 000 FCFA",
    debouche: Debouche.saturee,
  ),
  Filiere(
    nom: "Hôtellerie",
    domaine: "Tourisme",
    duree: "2 ans",
    description: "Gestion des établissements touristiques et hôteliers",
    debouches: "Hôtelier, Guide touristique, Agent de voyage",
    salaireMoyen: "220 000 FCFA",
    debouche: Debouche.moyenne,
  ),
  Filiere(
    nom: "Filiere Mathematique",
    domaine: "Mathematiques",
    duree: "3 ans",
    description: "Formation aux mathématiques appliquées et théoriques",
    debouches: "Mathématicien, Analyste de données, Enseignant",
    salaireMoyen: "250 000 FCFA",
    debouche: Debouche.recherchee,
  ),
  Filiere(
    nom: "Filiere litteraire",
    domaine: "Langues et littérature",
    duree: "3 ans",
    description: "La filière littéraire étudie les langues, la culture et la communication.",
    debouches: "Diplômate, Écrivain/Auteur, Bibliothécaire",
    salaireMoyen: "350 000 FCFA",
    debouche: Debouche.saturee,
  ),
  Filiere(
    nom: "Filiere Scientifique",
    domaine: "Physique-Chimie",
    duree: "3 ans",
    description: "Formation aux sciences physiques et naturelles",
    debouches: "Chercheur, Enseignant, Technicien de laboratoire",
    salaireMoyen: "300 000 FCFA",
    debouche: Debouche.recherchee,
  ),
];


class ExplorateurFilieres extends StatefulWidget {
  const ExplorateurFilieres({super.key});

  @override
  State<ExplorateurFilieres> createState() => _ExplorateurFilieresState();
}

class _ExplorateurFilieresState extends State<ExplorateurFilieres> {

  String _recherche = "";
  String _filtreCategorie = "Tous";
  static const Color primaryGreen = Color(0xFF04A447);

  @override
  Widget build(BuildContext context) {
    final listeFiltree = filieres.where((filiere) {
      if (_recherche.isNotEmpty && !filiere.nom.toLowerCase().contains(_recherche.toLowerCase())) {
        return false;
      }
      if (_filtreCategorie == "Tous") return true;
      if (_filtreCategorie == "Lycée") {
        return filiere.domaine == "Langues et littérature" ||
            filiere.domaine == "Mathematiques" ||
            filiere.domaine == "Physique-Chimie";
      }
      if (_filtreCategorie == "Université") {
        return !filiere.nom.contains("Lycée") && !filiere.nom.contains("litteraire") && !filiere.nom.contains("Mathématique");
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Explorateur de filières"),
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              onChanged: (valeur) => setState(() => _recherche = valeur),
              decoration: InputDecoration(
                hintText: "Rechercher une filière...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                FilterChip(
                  label: const Text("Tous"),
                  selected: _filtreCategorie == "Tous",
                  onSelected: (selected) => setState(() => _filtreCategorie = "Tous"),
                  backgroundColor: Colors.grey[200],
                  selectedColor: primaryGreen,
                  labelStyle: TextStyle(
                    color: _filtreCategorie == "Tous" ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text("Lycée"),
                  selected: _filtreCategorie == "Lycée",
                  onSelected: (selected) => setState(() => _filtreCategorie = "Lycée"),
                  backgroundColor: Colors.grey[200],
                  selectedColor: primaryGreen,
                  labelStyle: TextStyle(
                    color: _filtreCategorie == "Lycée" ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text("Université"),
                  selected: _filtreCategorie == "Université",
                  onSelected: (selected) => setState(() => _filtreCategorie = "Université"),
                  backgroundColor: Colors.grey[200],
                  selectedColor: primaryGreen,
                  labelStyle: TextStyle(
                    color: _filtreCategorie == "Université" ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listeFiltree.length,
              itemBuilder: (context, index) {
                final filiere = listeFiltree[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green[100],
                      child: _getIconForDomaine(filiere.domaine),
                    ),
                    title: Text(filiere.nom),
                    subtitle: Text("${filiere.domaine} • ${filiere.duree}"),
                    trailing: _buildDeboucheBadge(filiere.debouche),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FicheFiliere(filiere: filiere),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDeboucheBadge(Debouche debouches) {
    final color = debouches == Debouche.recherchee
        ? Colors.green
        : debouches == Debouche.moyenne
        ? Colors.orange
        : Colors.red;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Text(debouches.name, style: const TextStyle(color: Colors.white, fontSize: 11)),
    );
  }

  Widget _getIconForDomaine(String domaine) {
    if (domaine == "Sciences & Tech") return Icon(Icons.computer, color: Colors.green);
    if (domaine == "Sciences juridiques") return Icon(Icons.gavel, color: Colors.green);
    if (domaine == "Lettres & Arts") return Icon(Icons.menu_book, color: Colors.green);
    if (domaine == "Sciences de la santé") return Icon(Icons.medical_services, color: Colors.green);
    if (domaine == "Batiment") return Icon(Icons.apartment, color: Colors.green);
    if (domaine == "Buisness") return Icon(Icons.business_center, color: Colors.green);
    if (domaine == "Sciences agronomiques") return Icon(Icons.agriculture, color: Colors.green);
    if (domaine == "Economie & Finance") return Icon(Icons.attach_money, color: Colors.green);
    if (domaine == "Journalisme & Medias") return Icon(Icons.newspaper, color: Colors.green);
    if (domaine == "Tourisme") return Icon(Icons.flight, color: Colors.green);
    if (domaine == "Mathematiques") return Icon(Icons.calculate, color: Colors.green);
    if (domaine == "Langues et littérature") return Icon(Icons.library_books, color: Colors.green);
    if (domaine == "Physique-Chimie") return Icon(Icons.science, color: Colors.green);
    return Icon(Icons.business_center, color: Colors.green);
  }
}