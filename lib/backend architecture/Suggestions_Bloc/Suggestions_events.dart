part of 'Suggestions_bloc.dart';

abstract class SuggestionsEvents extends Equatable {
  List<Object?> get props => [];
}

class AskOffresSuggestion extends SuggestionsEvents {
  final String? suggestion;
  AskOffresSuggestion({this.suggestion});
  @override
  List<Object?> get props => [suggestion];
}

class AskEntreprisesSuggestion extends SuggestionsEvents {
  final String? suggestion;
  AskEntreprisesSuggestion({this.suggestion});
  @override
  List<Object?> get props => [suggestion];
}

class AskFavoritesSuggestion extends SuggestionsEvents {
  final String? suggestion;
  AskFavoritesSuggestion({this.suggestion});
  @override
  List<Object?> get props => [suggestion];
}

class GetOffresSuggestions extends SuggestionsEvents {
  final QuerySnapshot? evenement;
  final String? suggestion;
  GetOffresSuggestions({this.evenement, this.suggestion});
  @override
  List<Object?> get props => [evenement, suggestion];
}

class GetEntreprisesSuggestions extends SuggestionsEvents {
  final QuerySnapshot? evenement;
  final String? suggestion;
  GetEntreprisesSuggestions({this.evenement, this.suggestion});
  @override
  List<Object?> get props => [evenement, suggestion];
}

class GetFavoritesSuggestions extends SuggestionsEvents {
  final QuerySnapshot? evenement;
  final String? suggestion;
  GetFavoritesSuggestions({this.evenement, this.suggestion});
  @override
  List<Object?> get props => [evenement, suggestion];
}
