import 'package:flutter/material.dart';
import '../models/etablissement.dart';
import 'fiche_etablissement.dart';

class RechercheGlobale extends StatefulWidget {
  const RechercheGlobale({super.key});

  @override
  State<RechercheGlobale> createState() => _RechercheGlobaleState();
}

class _RechercheGlobaleState extends State<RechercheGlobale> {
  String _recherche = "";
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultats = etablissements.where((etab) {
      return _recherche.isNotEmpty &&
          (etab.nom.toLowerCase().contains(_recherche.toLowerCase()) ||
              etab.ville.toLowerCase().contains(_recherche.toLowerCase()));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recherche"),
        backgroundColor: const Color(0xFFF88500),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              autofocus: true,
              onChanged: (value) => setState(() => _recherche = value),
              decoration: InputDecoration(
                hintText: "Nom de l'établissement ou ville...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _recherche.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    setState(() => _recherche = "");
                  },
                )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          if (_recherche.isEmpty)
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      "Tapez le nom d'un établissement\nou d'une ville",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          else if (resultats.isEmpty)
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      "Aucun résultat trouvé",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: resultats.length,
                itemBuilder: (context, index) {
                  final etab = resultats[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange[100],
                        child: const Icon(Icons.school, color: Colors.orange),
                      ),
                      title: Text(
                        etab.nom,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text("${etab.ville} • ${etab.type.name}"),
                      trailing: _buildStatutBadge(etab.statut),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FicheEtablissement(etablissement: etab),
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

  Widget _buildStatutBadge(StatutInscription statut) {
    final color = statut == StatutInscription.ouverte
        ? Colors.green
        : statut == StatutInscription.bientot
        ? Colors.orange
        : Colors.red;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Text(
        statut.name,
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }
}