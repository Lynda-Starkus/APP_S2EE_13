import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Entreprise extends Equatable {
  String? nom;
  String? adresse;
  String? description;
  String? type;
  String? logo;
  int? emploi;
  int? ouvrier;
  int? pratique;
  int? stand;
  int? pfe;
  List<dynamic>? favorites;
  Entreprise(
      {this.adresse,
      this.favorites,
      this.description,
      this.emploi,
      this.nom,
      this.ouvrier,
      this.pfe,
      this.pratique,
      this.stand,
      this.type,
      this.logo});
  Entreprise copyWith(List<dynamic> favorites) {
    return Entreprise(favorites: this.favorites);
  }

  Map<String, dynamic> toJson() => {
        "nom": nom,
        "adresse": adresse,
        "type": type,
        "logo": logo,
        "emploi": emploi,
        "ouvrier": ouvrier,
        "pratique": pratique,
        "pfe": pfe,
        "stand": stand,
        "description": description,
        "favorites": favorites
      };
  Entreprise fromJson(QueryDocumentSnapshot snapshot) {
    return Entreprise(
        adresse:
            snapshot.data().containsKey("adresse") ? snapshot["adresse"] : "",
        nom: snapshot.data().containsKey("nom") ? snapshot["nom"] : "",
        description: snapshot.data().containsKey("description")
            ? snapshot["description"]
            : "",
        emploi: snapshot.data().containsKey("emploi") ? snapshot["emploi"] : 0,
        ouvrier:
            snapshot.data().containsKey("ouvrier") ? snapshot["ouvrier"] : 0,
        pfe: snapshot.data().containsKey("pfe") ? snapshot["pfe"] : 0,
        pratique:
            snapshot.data().containsKey("pratique") ? snapshot["pratique"] : 0,
        stand: snapshot.data().containsKey("stand") ? snapshot["stand"] : 0,
        type: snapshot.data().containsKey("type agence")
            ? snapshot["type agence"]
            : "",
        logo: snapshot.data().containsKey("logo")
            ? snapshot["logo"]
            : "https://firebasestorage.googleapis.com/v0/b/s2eeapp.appspot.com/o/BIGmama.png?alt=media&token=72c0fcaa-9103-4666-9517-959c6301e2f3",
        favorites: snapshot.data().containsKey("favorites")
            ? snapshot["favorites"]
            : []);
  }

  @override
  List<Object?> get props => [
        nom,
        adresse,
        description,
        type,
        emploi,
        ouvrier,
        pratique,
        stand,
        pfe,
        logo,
        favorites
      ];
}
