enum TypeEtablissement { public, prive }
enum StatutInscription { ouverte, bientot, fermer }
enum Concours { oui, non }

class Etablissement {
  final String nom;
  final String ville;
  final TypeEtablissement type;
  final StatutInscription statut;
  final Concours concours;

  Etablissement({
    required this.nom,
    required this.ville,
    required this.type,
    required this.statut,
    required this.concours,
  });
}

final List<Etablissement> etablissements = [
  Etablissement(nom: "UFHB", ville: "Abidjan", type: TypeEtablissement.public, statut: StatutInscription.ouverte, concours: Concours.non),
  Etablissement(nom: "INPHB", ville: "Yamoussoukro", type: TypeEtablissement.public, statut: StatutInscription.bientot, concours: Concours.oui),
  Etablissement(nom: "ESATIC", ville: "Abidjan", type: TypeEtablissement.public, statut: StatutInscription.fermer, concours: Concours.oui),
  Etablissement(nom: "IIT", ville: "Grand-Bassam", type: TypeEtablissement.prive, statut: StatutInscription.fermer, concours: Concours.non),
  Etablissement(nom: "IUGB", ville: "Grand-Bassam", type: TypeEtablissement.prive, statut: StatutInscription.fermer, concours: Concours.oui),
  Etablissement(nom: "UVHK", ville: "Bonoua", type: TypeEtablissement.prive, statut: StatutInscription.ouverte, concours: Concours.non),
  Etablissement(nom: "Université de San-Pédro", ville: "San-Pédro", type: TypeEtablissement.public, statut: StatutInscription.ouverte, concours: Concours.non),
  Etablissement(nom: "Université Alassane Ouattara", ville: "Bouaké", type: TypeEtablissement.public, statut: StatutInscription.bientot, concours: Concours.oui),
  Etablissement(nom: "UCAO", ville: "Abidjan", type: TypeEtablissement.public, statut: StatutInscription.ouverte, concours: Concours.non),
];
