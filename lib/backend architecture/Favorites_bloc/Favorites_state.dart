part of 'Favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesReady extends FavoritesState {
  List<Entreprise> favorites;
  FavoritesReady({required this.favorites});
  @override
  List<Object> get props => [favorites];
}
