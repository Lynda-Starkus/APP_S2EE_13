part of 'Favorites_bloc.dart';

abstract class FavoritesEvents extends Equatable {
  List<Object?> get props => [];
}

class AskFavorites extends FavoritesEvents {}

class GetFavorites extends FavoritesEvents {
  final QuerySnapshot? evenement;
  GetFavorites({this.evenement});
  @override
  List<Object?> get props => [evenement];
}

class AskAddFavorites extends FavoritesEvents {
  final Entreprise? entreprise;
  AskAddFavorites({this.entreprise});
  @override
  List<Object?> get props => [entreprise];
}

class AskDeleteFavorites extends FavoritesEvents {
  final Entreprise? entreprise;
  AskDeleteFavorites({this.entreprise});
  @override
  List<Object?> get props => [entreprise];
}

class AskFavoritesResult extends FavoritesEvents {
  String res;
  AskFavoritesResult(@required this.res);
  @override
  List<Object> get props => [res];
}

class GetResults extends FavoritesEvents {
  final QuerySnapshot? evenement;
  final String? result;
  GetResults({this.evenement, this.result});
  @override
  List<Object?> get props => [evenement];
}
