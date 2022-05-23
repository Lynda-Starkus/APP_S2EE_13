import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/database_managment.dart';
import 'package:s2ee_new/backend%20architecture/models/Entreprise.dart';
import 'package:s2ee_new/backend%20architecture/models/Offre.dart';

part 'Suggestions_events.dart';
part 'Suggestions_state.dart';

class SuggestionsBloc extends Bloc<SuggestionsEvents, SuggestionsState> {
  // StreamSubscription? _suggestionsub;
  final Offre offre = new Offre();
  final Entreprise ent = new Entreprise();
  final Data _data = new Data();
  SuggestionsBloc() : super(SuggestionsInitial()) {
    on<AskOffresSuggestion>((event, emit) async {
      if (event.suggestion == '') {
        emit(SuggestionsInitial());
      } else {
        //  await _suggestionsub?.cancel();
        _data.getOffres().listen((evente) => add(GetOffresSuggestions(
            evenement: evente, suggestion: event.suggestion)));
      }
    });
    on<GetOffresSuggestions>((event, emit) {
      List<Offre> firstList = [];
      List<String?> filtered = [];
      firstList = event.evenement!.docs.map((e) => offre.fromJson(e)).toList();
      firstList.forEach((element) {
        if (element.profile!
            .toLowerCase()
            .startsWith(event.suggestion!.toLowerCase())) {
          filtered.add(element.profile);
        }
      });
      emit(SuggestionsReady(suggestions: filtered));
    });
    on<AskEntreprisesSuggestion>((event, emit) async {
      if (event.suggestion == '') {
        emit(SuggestionsInitial());
      } else {
        // await _suggestionsub?.cancel();
        _data.getEntreprise().listen((evente) => add(GetEntreprisesSuggestions(
            evenement: evente, suggestion: event.suggestion)));
      }
    });
    on<GetEntreprisesSuggestions>((event, emit) {
      List<Entreprise> firstList = [];
      List<String?> filtered = [];
      firstList = event.evenement!.docs.map((e) => ent.fromJson(e)).toList();
      firstList.forEach((element) {
        if (element.nom!
            .toLowerCase()
            .startsWith(event.suggestion!.toLowerCase())) {
          filtered.add(element.nom);
        }
      });
      emit(SuggestionsReady(suggestions: filtered));
    });

    on<AskFavoritesSuggestion>((event, emit) async {
      if (event.suggestion == '') {
        emit(SuggestionsInitial());
      } else {
        // await _suggestionsub?.cancel();
        _data.showFavorite()!.listen((evente) => add(GetFavoritesSuggestions(
            evenement: evente, suggestion: event.suggestion)));
      }
    });
    on<GetFavoritesSuggestions>((event, emit) async {
      List<Entreprise> firstList = [];
      List<String?> filtered = [];
      firstList = event.evenement!.docs.map((e) => ent.fromJson(e)).toList();
      firstList.forEach((element) {
        if (element.nom!
            .toLowerCase()
            .startsWith(event.suggestion!.toLowerCase())) {
          filtered.add(element.nom);
        }
      });
      emit(SuggestionsReady(suggestions: filtered));
    });
  }
}
