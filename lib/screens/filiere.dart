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
            // header vert
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
            // infos
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
];


class ExplorateurFilieres extends StatefulWidget {
  const ExplorateurFilieres({super.key});

  @override
  State<ExplorateurFilieres> createState() => _ExplorateurFilieresState();
}

class _ExplorateurFilieresState extends State<ExplorateurFilieres> {

  String _recherche = "";
  static const Color primaryGreen = Color(0xFF04A447);

  @override
  Widget build(BuildContext context) {
    final listeFiltree = filieres.where((filieres) {
      if (_recherche.isNotEmpty && !filieres.nom.toLowerCase().contains(_recherche.toLowerCase())) return false;
      return true;
    }).toList();
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: primaryGreen,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Explorateur de filieres",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                Text("Supérieur & Secondaire",
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
            child: TextField(
              onChanged: (valeur) => setState(() => _recherche = valeur),
              decoration: InputDecoration(
                hintText: "Rechercher un établissement...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listeFiltree.length,
              itemBuilder: (context, index) {
                final filieres = listeFiltree[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green[100],
                      child: Icon(
                        filieres.domaine == "Sciences & Tech" ? Icons.computer
                            : filieres.domaine == "Sciences juridiques" ? Icons.gavel
                            : filieres.domaine == "Lettres & Arts" ? Icons.menu_book
                            : filieres.domaine == "Sciences de la santé" ? Icons.medical_services
                            : filieres.domaine == "Batiment" ? Icons.apartment
                            : filieres.domaine == "Buisness" ? Icons.business_center
                            : filieres.domaine == "Sciences agronomiques" ? Icons.agriculture
                            : filieres.domaine == "Economie & Finance" ? Icons.attach_money
                            : filieres.domaine == "Journalisme & Medias" ? Icons.newspaper
                            : filieres.domaine == "Tourisme" ? Icons.flight
                            : Icons.business_center,
                        color: Colors.green,
                      ),
                    ),
                    title: Text(filieres.nom),
                    subtitle: Text("${filieres.domaine} • ${filieres.duree}"),
                    trailing: _buildDeboucheBadge(filieres.debouche),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FicheFiliere(filiere: filieres),
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
}