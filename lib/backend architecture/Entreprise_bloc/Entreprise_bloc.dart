import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/database_managment.dart';
import 'package:s2ee_new/backend%20architecture/models/Entreprise.dart';
import '../database_managment.dart';
import '../models/Entreprise.dart';

import 'package:bloc/bloc.dart';
part 'Entreprise_events.dart';
part 'Entrerprise_state.dart';

class EntreprisesBloc extends Bloc<EntrerpiseEvents, EntreprisesState> {
  Entreprise ent = new Entreprise();
  final Data _data = new Data();

  EntreprisesBloc() : super(EntreprisesInitial()) {
    on<AskEntrerprise>((event, emit) async {
      _data
          .getEntreprise()
          .listen((event) => add(GetEntreprise(evenement: event)));
    });

    on<GetEntreprise>((event, emit) {
      emit(EntreprisesInitial());
      emit(EntreprisesReady(
          entreprises: event.evenement!.docs
              .map((snapshot) => ent.fromJson(snapshot))
              .toList()));
    });
    on<AskOuvrier>((event, emit) async {
      // await _entrepriseSub.cancel();
      _data
          .getOuvrier()
          .listen((event) => add(GetEntreprise(evenement: event)));
    });
    on<AskPratique>((event, emit) async {
      //  await _entrepriseSub.cancel();
      _data
          .getPratique()
          .listen((event) => add(GetEntreprise(evenement: event)));
    });
    on<AskEmploi>((event, emit) async {
      //  await _entrepriseSub.cancel();
      _data.getEmploi().listen((event) => add(GetEntreprise(evenement: event)));
    });
    on<AskPfe>((event, emit) async {
      //  await _entrepriseSub.cancel();
      _data.getPfe().listen((event) => add(GetEntreprise(evenement: event)));
    });
    on<AskEntrepriseResult>((event, emit) async {
      // await _entrepriseSub.cancel();
      _data.getEntreprise().listen(
          (evente) => add(GetResults(evenement: evente, result: event.res)));
    });
    on<GetResults>((event, emit) {
      List<Entreprise> firstList = [];
      List<Entreprise> filtered = [];
      firstList = event.evenement!.docs.map((e) => ent.fromJson(e)).toList();
      firstList.forEach((element) {
        if (element.nom!.toLowerCase() == event.result!.toLowerCase()) {
          filtered.add(element);
        }
      });
      emit(EntreprisesInitial());
      emit(EntreprisesReady(entreprises: filtered));
    });
  }
}
