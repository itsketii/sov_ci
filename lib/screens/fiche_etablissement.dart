import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/etablissement.dart';
import '../services/database_service.dart';
import '../models/orientation_models.dart';
import 'filiere.dart';

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

            _ExpandedSection(
              title: "Filières disponibles",
              icon: Icons.collections_bookmark,
              children: etablissement.filieresList.map((filiere) => ListTile(
                leading: const Icon(Icons.check_circle, color: Color(0xFF04A447), size: 18),
                title: Text(filiere.nom),
                subtitle: Text("Durée: ${filiere.duree}"),
                onTap: () {
                  // Optionnel: naviguer vers la fiche détaillée de la filière
                },
              )).toList(),
            ),

            ListTile(leading: const Icon(Icons.attach_money, color: Colors.orange), title: const Text("Frais de scolarité"), subtitle: Text(etablissement.fraisScolarite)),

            // CONDITIONS D'ADMISSION
            ListTile(
                leading: const Icon(Icons.description, color: Colors.orange),
                title: const Text("Conditions d'admission"),
                subtitle: Text(etablissement.conditionsAdmission.isNotEmpty ? etablissement.conditionsAdmission : "Consulter l'établissement")
            ),

            // BOURSES
            if (etablissement.bourses.isNotEmpty)
              ListTile(
                  leading: const Icon(Icons.card_giftcard, color: Colors.orange),
                  title: const Text("Bourses"),
                  subtitle: Text(etablissement.bourses)
              ),

            ListTile(leading: const Icon(Icons.phone, color: Colors.orange), title: const Text("Contact"), subtitle: Text(etablissement.contact)),

            // EMAIL
            if (etablissement.email.isNotEmpty)
              ListTile(
                leading: const Icon(Icons.email, color: Colors.orange),
                title: const Text("Email"),
                subtitle: Text(etablissement.email),
                onTap: () async {
                  final url = Uri.parse("mailto:${etablissement.email}");
                  if (await canLaunchUrl(url)) await launchUrl(url);
                },
              ),

            // SITE WEB
            if (etablissement.siteWeb.isNotEmpty)
              ListTile(
                leading: const Icon(Icons.language, color: Colors.orange),
                title: const Text("Site web"),
                subtitle: Text(etablissement.siteWeb),
                onTap: () async {
                  final url = Uri.parse(etablissement.siteWeb);
                  if (await canLaunchUrl(url)) await launchUrl(url);
                },
              ),

            ListTile(leading: const Icon(Icons.location_on, color: Colors.orange), title: const Text("Localisation"), subtitle: Text(etablissement.ville)),

            // CARTE GOOGLE MAPS
            Container(
              margin: const EdgeInsets.all(16),
              height: 150,
              decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.green)),
              child: InkWell(
                onTap: () async {
                  final url = Uri.parse(
                      "https://www.google.com/maps/search/?api=1&query=${etablissement.latitude},${etablissement.longitude}"
                  );
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                },
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, color: Colors.green, size: 40),
                      SizedBox(height: 8),
                      Text("Cliquez pour voir la carte et l'itinéraire", style: TextStyle(color: Colors.green, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),

            // BOUTONS FAVORIS ET CONTACTER
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        final dbService = DatabaseService();
                        final messenger = ScaffoldMessenger.of(context);
                        await dbService.addFavorite(
                          Establishment(
                            id: etablissement.nom,
                            name: etablissement.nom,
                            type: etablissement.type.name,
                            location: etablissement.ville,
                            fees: etablissement.fraisScolarite,
                            field: etablissement.filieres,
                            totalFields: 1,
                            reputation: 4,
                            insertionRate: "N/A",
                          ),
                        );
                        messenger.showSnackBar(
                          SnackBar(content: Text("${etablissement.nom} ajouté aux favoris !")),
                        );
                      },
                      icon: const Icon(Icons.star, color: Colors.orange),
                      label: const Text("Favoris", style: TextStyle(color: Colors.orange)),
                      style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.orange)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final url = Uri.parse("tel:${etablissement.contact.replaceAll(' ', '')}");
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Impossible d'appeler ce numéro")),
                          );
                        }
                      },
                      icon: const Icon(Icons.phone),
                      label: const Text("Contacter"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpandedSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;
  const _ExpandedSection({required this.title, required this.icon, required this.children});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        children: children,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.only(left: 48),
      ),
    );
  }
}