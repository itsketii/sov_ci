enum TypeEtablissement { public, prive }
enum NiveauEtablissement { superieur, secondaire }
enum StatutInscription { ouverte, bientot, fermer }
enum Concours { oui, non }


class FiliereMini {
  final String nom;
  final String duree;
  FiliereMini({required this.nom, required this.duree});
}

class Etablissement {
  final String nom;
  final String ville;
  final TypeEtablissement type;
  final StatutInscription statut;
  final Concours concours;
  final String filieres;
  final List<FiliereMini> filieresList;
  final String fraisScolarite;
  final String contact;
  final String email;
  final String siteWeb;
  final String conditionsAdmission;
  final String bourses;
  final double latitude;
  final double longitude;
  final NiveauEtablissement niveau;

  Etablissement({
    required this.nom,
    required this.ville,
    required this.type,
    required this.statut,
    required this.concours,
    this.filieres = "",
    this.filieresList = const [],
    this.fraisScolarite = "",
    this.contact = "",
    this.email = "",
    this.siteWeb = "",
    this.conditionsAdmission = "Consulter l'établissement",
    this.bourses = "",
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.niveau = NiveauEtablissement.superieur,
  });
}

final List<Etablissement> etablissements = [
    Etablissement(
        nom: "UFHB",
        ville: "Abidjan",
        type: TypeEtablissement.public,
        statut: StatutInscription.ouverte,
        concours: Concours.non,
        filieres: "Droit, Médecine, Sciences, Lettres",
        filieresList: [
          FiliereMini(nom: "Droit", duree: "3 ans"),
          FiliereMini(nom: "Médecine", duree: "7 ans"),
          FiliereMini(nom: "Sciences", duree: "3 ans"),
          FiliereMini(nom: "Lettres", duree: "3 ans"),
        ],
        fraisScolarite: "Gratuit",
        contact: "+225 27 22 44 90 00",
        email: "contact@ufhb.ci",
        siteWeb: "https://www.ufhb.ci",
        conditionsAdmission: "BAC toutes séries, dossier disponible sur le site",
        bourses: "Bourses d'État sur critères sociaux",
        latitude: 5.3484,
        longitude: -4.0165,
        niveau: NiveauEtablissement.superieur
    ),

    Etablissement(
        nom: "INPHB",
        ville: "Yamoussoukro",
        type: TypeEtablissement.public,
        statut: StatutInscription.bientot,
        concours: Concours.oui,
        filieres: "Génie civil, Informatique, Finance",
        filieresList: [
          FiliereMini(nom: "Génie civil", duree: "5 ans"),
          FiliereMini(nom: "Informatique", duree: "5 ans"),
          FiliereMini(nom: "Finance", duree: "3 ans"),
        ],
        fraisScolarite: "70 000 FCFA",
        contact: "+225 27 30 64 67 00",
        email: "contact@inphb.ci",
        siteWeb: "https://www.inphb.ci",
        conditionsAdmission: "BAC scientifique, concours national",
        bourses: "Bourses sur concours",
        latitude: 6.8276,
        longitude: -5.2893,
        niveau: NiveauEtablissement.superieur
    ),

    Etablissement(
        nom: "ESATIC",
        ville: "Abidjan",
        type: TypeEtablissement.public,
        statut: StatutInscription.fermer,
        concours: Concours.oui,
        filieres: "Informatique",
        filieresList: [
          FiliereMini(nom: "Informatique", duree: "3 ans"),
        ],
        fraisScolarite: "120 000 FCFA",
        contact: "+225 27 21 21 91 00",
        email: "contact@esatic.ci",
        siteWeb: "https://www.esatic.ci",
        conditionsAdmission: "BAC scientifique, concours",
        bourses: "Peu de bourses disponibles",
        latitude: 5.3600,
        longitude: -4.0100,
        niveau: NiveauEtablissement.superieur
    ),

    Etablissement(
        nom: "IIT",
        ville: "Grand-Bassam",
        type: TypeEtablissement.prive,
        statut: StatutInscription.fermer,
        concours: Concours.non,
        filieres: "Informatique, Génie civil, Business",
        filieresList: [
          FiliereMini(nom: "Informatique", duree: "3 ans"),
          FiliereMini(nom: "Génie civil", duree: "3 ans"),
          FiliereMini(nom: "Business", duree: "3 ans"),
        ],
        fraisScolarite: "1 500 000 FCFA",
        contact: "+225 01 53 15 15 15",
        email: "contact@iit.ci",
        siteWeb: "https://www.iit.ci",
        conditionsAdmission: "BAC toutes séries, étude de dossier",
        bourses: "Bourses internes disponibles",
        latitude: 5.2000,
        longitude: -3.7400,
        niveau: NiveauEtablissement.superieur
    ),

    Etablissement(
        nom: "IUGB",
        ville: "Grand-Bassam",
        type: TypeEtablissement.prive,
        statut: StatutInscription.fermer,
        concours: Concours.oui,
        filieres: "Informatique, Economie, Finance",
        filieresList: [
          FiliereMini(nom: "Informatique", duree: "4 ans"),
          FiliereMini(nom: "Economie", duree: "3 ans"),
          FiliereMini(nom: "Finance", duree: "3 ans"),
        ],
        fraisScolarite: "3 000 000 FCFA",
        contact: "+225 27 21 30 36 40",
        email: "contact@iugb.ci",
        siteWeb: "https://www.iugb.ci",
        conditionsAdmission: "BAC, test d'anglais",
        bourses: "Bourses universitaires disponibles",
        latitude: 5.2100,
        longitude: -3.7350,
        niveau: NiveauEtablissement.superieur
    ),

    Etablissement(
        nom: "UVHK",
        ville: "Bonoua",
        type: TypeEtablissement.prive,
        statut: StatutInscription.ouverte,
        concours: Concours.non,
        filieres: "Droit, Economie, Génie civil",
        filieresList: [
          FiliereMini(nom: "Droit", duree: "3 ans"),
          FiliereMini(nom: "Economie", duree: "3 ans"),
          FiliereMini(nom: "Génie civil", duree: "3 ans"),
        ],
        fraisScolarite: "Gratuit",
        contact: "+225 07 47 40 02 83",
        email: "contact@uvhk.ci",
        siteWeb: "https://www.uvhk.ci",
        conditionsAdmission: "BAC toutes séries",
        bourses: "Bourses sur dossier",
        latitude: 5.2700,
        longitude: -3.6000,
        niveau: NiveauEtablissement.superieur
    ),

    Etablissement(
        nom: "Université de San-Pédro",
        ville: "San-Pédro",
        type: TypeEtablissement.public,
        statut: StatutInscription.ouverte,
        concours: Concours.non,
        filieres: "Médecine, Agriculture, Tourisme",
        filieresList: [
          FiliereMini(nom: "Médecine", duree: "7 ans"),
          FiliereMini(nom: "Agriculture", duree: "3 ans"),
          FiliereMini(nom: "Tourisme", duree: "3 ans"),
        ],
        fraisScolarite: "Gratuit",
        contact: "+225 05 06 88 566 46",
        email: "contact@univ-sanpedro.ci",
        siteWeb: "https://www.univ-sanpedro.ci",
        conditionsAdmission: "BAC, dossier",
        bourses: "Bourses d'État",
        latitude: 4.7420,
        longitude: -6.6360,
        niveau: NiveauEtablissement.superieur
    ),

    Etablissement(
        nom: "Université Alassane Ouattara",
        ville: "Bouaké",
        type: TypeEtablissement.public,
        statut: StatutInscription.bientot,
        concours: Concours.oui,
        filieres: "Droit, Economie & Gestion, Médecine, Informatique",
        filieresList: [
          FiliereMini(nom: "Droit", duree: "3 ans"),
          FiliereMini(nom: "Economie & Gestion", duree: "3 ans"),
          FiliereMini(nom: "Médecine", duree: "7 ans"),
          FiliereMini(nom: "Informatique", duree: "3 ans"),
        ],
        fraisScolarite: "30 000 FCFA",
        contact: "+225 31 63 32 42",
        email: "contact@uao.ci",
        siteWeb: "https://www.uao.ci",
        conditionsAdmission: "BAC, concours pour Médecine",
        bourses: "Bourses sur concours",
        latitude: 7.6910,
        longitude: -5.0300,
        niveau: NiveauEtablissement.superieur
    ),

    Etablissement(
        nom: "UCAO",
        ville: "Abidjan",
        type: TypeEtablissement.public,
        statut: StatutInscription.ouverte,
        concours: Concours.non,
        filieres: "Droit, Economie & Gestion",
        filieresList: [
          FiliereMini(nom: "Droit", duree: "3 ans"),
          FiliereMini(nom: "Economie & Gestion", duree: "3 ans"),
        ],
        fraisScolarite: "230 000 FCFA",
        contact: "+225 27 22 40 06 50",
        email: "contact@ucao.ci",
        siteWeb: "https://www.ucao.ci",
        conditionsAdmission: "BAC, dossier",
        bourses: "Bourses limitées",
        latitude: 5.3500,
        longitude: -4.0200,
        niveau: NiveauEtablissement.superieur
    ),

    // LYCÉES
    Etablissement(
        nom: "IRMA",
        ville: "Grand-Bassam",
        type: TypeEtablissement.prive,
        statut: StatutInscription.ouverte,
        concours: Concours.oui,
        filieres: "Scientifique, Littéraire, Mathématique",
        filieresList: [
          FiliereMini(nom: "Scientifique", duree: "2 ans"),
          FiliereMini(nom: "Littéraire", duree: "2 ans"),
          FiliereMini(nom: "Mathématique", duree: "2 ans"),
        ],
        fraisScolarite: "1 800 000 FCFA",
        contact: "+225 07 09 33 22 62",
        email: "contact@irma.ci",
        siteWeb: "https://www.irma.ci",
        conditionsAdmission: "BEPC, test d'entrée",
        bourses: "Bourses sur dossier",
        latitude: 5.2000,
        longitude: -3.7333,
        niveau: NiveauEtablissement.secondaire
    ),

    Etablissement(
        nom: "Robert-Leon",
        ville: "Grand-Bassam",
        type: TypeEtablissement.public,
        statut: StatutInscription.ouverte,
        concours: Concours.non,
        filieres: "Scientifique, Littéraire, Mathématique",
        filieresList: [
          FiliereMini(nom: "Scientifique", duree: "2 ans"),
          FiliereMini(nom: "Littéraire", duree: "2 ans"),
          FiliereMini(nom: "Mathématique", duree: "2 ans"),
        ],
        fraisScolarite: "150 000 FCFA",
        contact: "+225 25 21 01 41 80",
        email: "contact@robertleon.ci",
        siteWeb: "https://www.robertleon.ci",
        conditionsAdmission: "BEPC, dossier",
        bourses: "Bourses d'État",
        latitude: 5.21785,
        longitude: -3.74809,
        niveau: NiveauEtablissement.secondaire
    ),

    Etablissement(
        nom: "Lycée Classique d'Abidjan",
        ville: "Abidjan",
        type: TypeEtablissement.prive,
        statut: StatutInscription.bientot,
        concours: Concours.oui,
        filieres: "Scientifique, Littéraire, Mathématique",
        filieresList: [
          FiliereMini(nom: "Scientifique", duree: "2 ans"),
          FiliereMini(nom: "Littéraire", duree: "2 ans"),
          FiliereMini(nom: "Mathématique", duree: "2 ans"),
        ],
        fraisScolarite: "500 000 FCFA",
        contact: "+225 27 22 4 43517",
        email: "contact@classique.ci",
        siteWeb: "https://www.classique.ci",
        conditionsAdmission: "BEPC, concours",
        bourses: "Bourses sur concours",
        latitude: 5.3533,
        longitude: 3.9912,
        niveau: NiveauEtablissement.secondaire
    ),

    Etablissement(
        nom: "Lycée Blaise-Pascal",
        ville: "Abidjan",
        type: TypeEtablissement.prive,
        statut: StatutInscription.fermer,
        concours: Concours.non,
        filieres: "Scientifique, Littéraire, Mathématique",
        filieresList: [
          FiliereMini(nom: "Scientifique", duree: "2 ans"),
          FiliereMini(nom: "Littéraire", duree: "2 ans"),
          FiliereMini(nom: "Mathématique", duree: "2 ans"),
        ],
        fraisScolarite: "1 000 000 FCFA",
        contact: "+225 27 22 40 55 80",
        email: "contact@blaise-pascal.ci",
        siteWeb: "https://www.blaise-pascal.ci",
        conditionsAdmission: "BEPC, dossier",
        bourses: "Non disponible",
        latitude: 5.3517,
        longitude: -3.9519,
        niveau: NiveauEtablissement.secondaire
    ),

    Etablissement(
        nom: "Lycée Moderne de Port Bouet",
        ville: "Port Bouet",
        type: TypeEtablissement.public,
        statut: StatutInscription.bientot,
        concours: Concours.non,
        filieres: "Scientifique, Littéraire, Mathématique",
        filieresList: [
          FiliereMini(nom: "Scientifique", duree: "2 ans"),
          FiliereMini(nom: "Littéraire", duree: "2 ans"),
          FiliereMini(nom: "Mathématique", duree: "2 ans"),
        ],
        fraisScolarite: "Gratuit",
        contact: "+225 21 27 72 95",
        email: "contact@portbouet.ci",
        siteWeb: "https://www.portbouet.ci",
        conditionsAdmission: "BEPC, dossier",
        bourses: "Bourses d'État",
        latitude: 5.25604,
        longitude: -3.95782,
        niveau: NiveauEtablissement.secondaire
    ),

    Etablissement(
        nom: "Lycée Technique",
        ville: "Abidjan",
        type: TypeEtablissement.public,
        statut: StatutInscription.ouverte,
        concours: Concours.oui,
        filieres: "Scientifique, Littéraire, Mathématique",
        filieresList: [
          FiliereMini(nom: "Scientifique", duree: "2 ans"),
          FiliereMini(nom: "Littéraire", duree: "2 ans"),
          FiliereMini(nom: "Mathématique", duree: "2 ans"),
        ],
        fraisScolarite: "Gratuit",
        contact: "+225 27 21 30 45 55",
        email: "contact@lyceetech.ci",
        siteWeb: "https://www.lyceetech.ci",
        conditionsAdmission: "BEPC, concours",
        bourses: "Bourses d'État",
        latitude: 5.3496,
        longitude: -4.0090,
        niveau: NiveauEtablissement.secondaire
    ),
];
