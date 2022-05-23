part of 'Entreprise_bloc.dart';

abstract class EntreprisesState extends Equatable {
  List<Object> get props => [];
}

class EntreprisesInitial extends EntreprisesState {}

class EntreprisesReady extends EntreprisesState {
  final List<Entreprise> entreprises;
  EntreprisesReady({required this.entreprises});
  @override
  List<Object> get props => [entreprises];
}
