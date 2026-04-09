enum TypeEtablissement { public, prive }
enum StatutInscription { ouverte, bientot, fermer }
enum Concours { oui, non }

class Etablissement {
  final String nom;
  final String ville;
  final TypeEtablissement type;
  final StatutInscription statut;
  final Concours concours;
  final String filieres;
  final String fraisScolarite;
  final String contact;
  final double latitude;
  final double longitude;

  Etablissement({
    required this.nom,
    required this.ville,
    required this.type,
    required this.statut,
    required this.concours,
    this.filieres = "",
    this.fraisScolarite = "",
    this.contact = "",
    this.latitude = 0.0,
    this.longitude = 0.0,
  });
}

final List<Etablissement> etablissements = [
  Etablissement(nom: "UFHB", ville: "Abidjan", type: TypeEtablissement.public, statut: StatutInscription.ouverte, concours: Concours.non, filieres: "Droit, Médecine, Sciences, Lettres", fraisScolarite: "Gratuit", contact: "+225 27 22 44 90 00", latitude: 5.3484, longitude: -4.0165),
  Etablissement(nom: "INPHB", ville: "Yamoussoukro", type: TypeEtablissement.public, statut: StatutInscription.bientot, concours: Concours.oui, filieres: "Génie civil, Informatique, Finace", fraisScolarite: "70 000 FCFA", contact: "+225 27 30 64 67 00", latitude: 6.8276, longitude: -5.2893),
  Etablissement(nom: "ESATIC", ville: "Abidjan", type: TypeEtablissement.public, statut: StatutInscription.fermer, concours: Concours.oui, filieres: "Informatique", fraisScolarite: "120 000 FCFA", contact: "+225 27 21 21 91 00", latitude: 5.3600, longitude: -4.0100),
  Etablissement(nom: "IIT", ville: "Grand-Bassam", type: TypeEtablissement.prive, statut: StatutInscription.fermer, concours: Concours.non, filieres: "Informatique, Génie civil, Buisness", fraisScolarite: "1 500 000 FCFA", contact: "+225 01 53 15 15 15", latitude: 5.2000, longitude: -3.7400),
  Etablissement(nom: "IUGB", ville: "Grand-Bassam", type: TypeEtablissement.prive, statut: StatutInscription.fermer, concours: Concours.oui, filieres: "Informatique, Economie, Finance", fraisScolarite: "3 000 000 FCFA", contact: "+225 27 21 30 36 40", latitude: 5.2100, longitude: -3.7350),
  Etablissement(nom: "UVHK", ville: "Bonoua", type: TypeEtablissement.prive, statut: StatutInscription.ouverte, concours: Concours.non, filieres: "Droit, Economie, Génie civil", fraisScolarite: "Gratuit", contact: "+225 07 47 40 02 83", latitude: 5.2700, longitude: -3.6000),
  Etablissement(nom: "Université de San-Pédro", ville: "San-Pédro", type: TypeEtablissement.public, statut: StatutInscription.ouverte, concours: Concours.non, filieres: "Médecine, Agriculture, Tourisme", fraisScolarite: "Gratuit", contact: "+225 05 06 88 566 46", latitude: 4.7420, longitude: -6.6360),
  Etablissement(nom: "Université Alassane Ouattara", ville: "Bouaké", type: TypeEtablissement.public, statut: StatutInscription.bientot, concours: Concours.oui, filieres: "Droit, Economie & Gestion, Médecine, Informatique", fraisScolarite: "30 000 FCA", contact: "+225 31 63 32 42", latitude: 7.6910, longitude: -5.0300),
  Etablissement(nom: "UCAO", ville: "Abidjan", type: TypeEtablissement.public, statut: StatutInscription.ouverte, concours: Concours.non, filieres: "Droit, Economie & Gestion", fraisScolarite: "230 000 FCFA", contact: "+225 27 22 40 06 50 / 05 44 01 25 08", latitude: 5.3500, longitude: -4.0200),
];