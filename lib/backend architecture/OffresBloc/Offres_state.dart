part of 'Offres_bloc.dart';

abstract class OffresState extends Equatable {
  List<Object> get props => [];
}

class OffresInitial extends OffresState {}

class OffresReady extends OffresState {
  List<Offre> offres;
  OffresReady({required this.offres});
  @override
  List<Object> get props => [offres];
}
