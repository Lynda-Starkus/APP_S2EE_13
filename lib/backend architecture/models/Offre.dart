import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Offre extends Equatable {
  String? nom;
  String? logo;
  String? poste;
  String? profile;

  Offre({this.nom, this.logo, this.poste, this.profile});
  Map<String, dynamic> toJson() => {
        "nom": nom,
        "poste": poste,
        "logo": logo,
        "profile": profile,
      };

  Offre fromJson(QueryDocumentSnapshot snapshot) {
    return Offre(
        nom: snapshot["nom"],
        poste: snapshot["poste"],
        profile: snapshot["profile"],
        logo: snapshot["logo"]);
  }

  @override
  List<Object?> get props => [nom, logo, poste, profile];
}
