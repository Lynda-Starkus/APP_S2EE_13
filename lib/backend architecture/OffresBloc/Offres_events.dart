part of 'Offres_bloc.dart';

abstract class OffresEvents extends Equatable {
  List<Object?> get props => [];
}

class AskOffres extends OffresEvents {}

class AskOuvrierOffre extends OffresEvents {}

class AskPratiqueOffre extends OffresEvents {}

class AskPfeOffre extends OffresEvents {}

class AskEmploiOffre extends OffresEvents {}

class AskDevelopment extends OffresEvents {}

class AskDesign extends OffresEvents {}

class AskUX extends OffresEvents {}

class AskData extends OffresEvents {}

/*class AskSuggestion extends OffresEvents {
  final String suggestion;
  AskSuggestion({this.suggestion});
  @override
  List<Object> get props => [suggestion];
}*/

class AskResult extends OffresEvents {
  String res;
  AskResult(@required this.res);
  @override
  List<Object> get props => [res];
}

class GetDevelopment extends OffresEvents {
  final QuerySnapshot? evenement;
  GetDevelopment({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class GetResults extends OffresEvents {
  final QuerySnapshot? evenement;
  final String? result;
  GetResults({this.evenement, this.result});
  @override
  List<Object?> get props => [evenement];
}

class GetDesign extends OffresEvents {
  final QuerySnapshot? evenement;
  GetDesign({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class GetUX extends OffresEvents {
  final QuerySnapshot? evenement;
  GetUX({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class GetData extends OffresEvents {
  final QuerySnapshot? evenement;
  GetData({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class GetOffres extends OffresEvents {
  final QuerySnapshot? evenement;
  GetOffres({this.evenement});
  @override
  List<Object?> get props => [evenement];
}
