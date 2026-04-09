import 'package:flutter/material.dart';
import '../models/etablissement.dart';

class FicheEtablissement extends StatelessWidget {
  final Etablissement etablissement;
  const FicheEtablissement({super.key, required this.etablissement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF04A447),
        foregroundColor: Colors.white,
        title: const Text("Retour"),
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
                  Text(etablissement.nom, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(etablissement.ville, style: const TextStyle(fontSize: 13, color: Colors.white)),
                ],
              ),
            ),
            ListTile(leading: const Icon(Icons.location_city, color: Colors.orange), title: const Text("Type"), subtitle: Text(etablissement.type.name)),
            ListTile(leading: const Icon(Icons.how_to_reg, color: Colors.orange), title: const Text("Statut des inscriptions"), subtitle: Text(etablissement.statut.name)),
            ListTile(leading: const Icon(Icons.school, color: Colors.orange), title: const Text("Concours"), subtitle: Text(etablissement.concours == Concours.oui ? "Avec concours" : "Sans concours")),
            ListTile(leading: const Icon(Icons.collections_bookmark, color: Colors.orange), title: const Text("Filières disponibles"), subtitle: Text(etablissement.filieres)),
            ListTile(leading: const Icon(Icons.attach_money, color: Colors.orange), title: const Text("Frais de scolarité"), subtitle: Text(etablissement.fraisScolarite)),
            ListTile(leading: const Icon(Icons.phone, color: Colors.orange), title: const Text("Contact"), subtitle: Text(etablissement.contact)),
            ListTile(leading: const Icon(Icons.location_on, color: Colors.orange), title: const Text("Localisation"), subtitle: Text(etablissement.ville)),
            Container(
              margin: const EdgeInsets.all(16),
              height: 150,
              decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.green)),
              child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.map, color: Colors.green, size: 40), Text("Carte Google Maps", style: TextStyle(color: Colors.green))])),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.star, color: Colors.orange), label: const Text("Favoris", style: TextStyle(color: Colors.orange)), style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.orange)))),
                  const SizedBox(width: 12),
                  Expanded(child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.directions), label: const Text("Y aller"), style: ElevatedButton.styleFrom(backgroundColor: Colors.green))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}