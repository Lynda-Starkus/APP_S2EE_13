part of 'Entreprise_bloc.dart';

abstract class EntrerpiseEvents extends Equatable {
  List<Object?> get props => [];
}

class AskEntrerprise extends EntrerpiseEvents {}

class AskOuvrier extends EntrerpiseEvents {}

class AskPratique extends EntrerpiseEvents {}

class AskPfe extends EntrerpiseEvents {}

class AskEmploi extends EntrerpiseEvents {}

class GetEntreprise extends EntrerpiseEvents {
  final QuerySnapshot? evenement;
  GetEntreprise({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class OuvrierEntreprise extends EntrerpiseEvents {
  final QuerySnapshot? evenement;
  OuvrierEntreprise({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class PratiqueEntreprise extends EntrerpiseEvents {
  final QuerySnapshot? evenement;
  PratiqueEntreprise({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class PfeEntreprise extends EntrerpiseEvents {
  final QuerySnapshot? evenement;
  PfeEntreprise({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class EmploiEntreprise extends EntrerpiseEvents {
  final QuerySnapshot? evenement;
  EmploiEntreprise({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class AskEntrepriseResult extends EntrerpiseEvents {
  String res;
  AskEntrepriseResult(@required this.res);
  @override
  List<Object> get props => [res];
}

class GetResults extends EntrerpiseEvents {
  final QuerySnapshot? evenement;
  final String? result;
  GetResults({this.evenement, this.result});
  @override
  List<Object?> get props => [evenement];
}
