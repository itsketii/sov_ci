import 'package:flutter/material.dart';
import '../models/etablissement.dart';



class Annuaire extends StatefulWidget {
  const Annuaire({super.key});

  @override
  State<Annuaire> createState() => _AnnuaireState();
}

class _AnnuaireState extends State<Annuaire> {
  int _selectedIndex = 0;
  String _filtreActif = "Tous";
  String _recherche = "";
  static const Color primaryOrange = Color(0xFFF88500);

  @override
  Widget build(BuildContext context) {
    final listeFiltree = etablissements.where((etab) {
      if (_recherche.isNotEmpty && !etab.nom.toLowerCase().contains(_recherche.toLowerCase())) return false;
      if (_filtreActif == "Tous") return true;
      if (_filtreActif == "Public") return etab.type == TypeEtablissement.public;
      if (_filtreActif == "Privé") return etab.type == TypeEtablissement.prive;
      if (_filtreActif == "Abidjan") return etab.ville == "Abidjan";
      if (_filtreActif == "Yamoussoukro") return etab.ville == "Yamoussoukro";
      if (_filtreActif == "Grand-Bassam") return etab.ville == "Grand-Bassam";
      if (_filtreActif == "Bonoua") return etab.ville == "Bonoua";
      if (_filtreActif == "San-Pédro") return etab.ville == "San-Pédro";
      if (_filtreActif == "Bouaké") return etab.ville == "Bouaké";
      if (_filtreActif == "Ouverte") return etab.statut == StatutInscription.ouverte;
      if (_filtreActif == "Bientot") return etab.statut == StatutInscription.bientot;
      if (_filtreActif == "Fermée") return etab.statut == StatutInscription.fermer;
      if (_filtreActif == "Par concours") return etab.concours == Concours.oui;
      if (_filtreActif == "Pas de concours") return etab.concours == Concours.non;
      return true;
    }).toList();
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: primaryOrange,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Annuaire des établissements",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                Text("Supérieur & Secondaire",
                    style: TextStyle(fontSize: 13, color: Colors.white)),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                ActionChip(
                  label: Text("Tous"),
                  onPressed: () => setState(() => _filtreActif = "Tous"),
                ),
                SizedBox(width: 8),
                ActionChip(
                  label: Text("Public"),
                  onPressed: () => setState(() => _filtreActif = "Public"),
                ),
                SizedBox(width: 8),
                ActionChip(
                  label: Text("Privé"),
                  onPressed: () => setState(() => _filtreActif = "Privé"),
                ),
                SizedBox(width: 8),
                ActionChip(
                  label: Text("Abidjan"),
                  onPressed: () => setState(() => _filtreActif = "Abidjan"),
                ),
                SizedBox(width: 8),
                ActionChip(
                  label: Text("Yamoussoukro"),
                  onPressed: () => setState(() => _filtreActif = "Yamoussoukro"),
                ),
                SizedBox(width: 8),
                ActionChip(
                  label: Text("Ouverte"),
                  onPressed: () => setState(() => _filtreActif = "Ouverte"),
                ),
                SizedBox(width: 8),
                ActionChip(
                  label: Text("Bientot"),
                  onPressed: () => setState(() => _filtreActif = "Bientot"),
                ),
                SizedBox(width: 8),
                ActionChip(
                  label: Text("Fermée"),
                  onPressed: () => setState(() => _filtreActif = "Fermée"),
                ),
                SizedBox(width: 8),
                ActionChip(
                  label: Text("Par concours"),
                  onPressed: () => setState(() => _filtreActif = "Par concours"),
                ),
                SizedBox(width: 8),
                ActionChip(
                  label: Text("Pas de concours"),
                  onPressed: () => setState(() => _filtreActif = "Pas de concours"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
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
                final etab = listeFiltree[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange[100],
                      child: Icon(Icons.school, color: Colors.orange),
                    ),
                    title: Text(etab.nom),
                    subtitle: Text("${etab.ville} • ${etab.type.name}"),
                    trailing: _buildStatutBadge(etab.statut),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: primaryOrange,
        unselectedItemColor: const Color(0xFF0A0D14),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'Annuaire'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoris'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifs'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildStatutBadge(StatutInscription statut) {
    final color = statut == StatutInscription.ouverte
        ? Colors.green
        : statut == StatutInscription.bientot
        ? Colors.orange
        : Colors.red;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Text(statut.name, style: const TextStyle(color: Colors.white, fontSize: 11)),
    );
  }
}