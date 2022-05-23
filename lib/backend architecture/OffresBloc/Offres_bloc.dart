import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/database_managment.dart';
import 'package:s2ee_new/backend%20architecture/models/Offre.dart';

part 'Offres_events.dart';
part 'Offres_state.dart';

class OffresBloc extends Bloc<OffresEvents, OffresState> {
  // late StreamSubscription _offresub;
  final Offre offre = new Offre();
  final Data _data = new Data();
  OffresBloc() : super(OffresInitial()) {
    on<AskOffres>((event, emit) async {
      // await _offresub.cancel();
      //  _offresub =
      _data.getOffres().listen((event) => add(GetOffres(evenement: event)));
    });
    on<GetOffres>((event, emit) {
      emit(OffresInitial());
      emit(OffresReady(
          offres: event.evenement!.docs
              .map((snapshot) => offre.fromJson(snapshot))
              .toList()));
    });
    on<AskOuvrierOffre>((event, emit) async {
      // await _offresub.cancel();
      _data
          .getOuvrierOffres()
          .listen((event) => add(GetOffres(evenement: event)));
    });
    on<AskEmploiOffre>((event, emit) async {
      //await _offresub.cancel();
      _data
          .getEmploiOffres()
          .listen((event) => add(GetOffres(evenement: event)));
    });
    on<AskPfeOffre>((event, emit) async {
      // await _offresub.cancel();
      _data.getPfeOffres().listen((event) => add(GetOffres(evenement: event)));
    });
    on<AskPratiqueOffre>((event, emit) async {
      // await _offresub.cancel();
      _data
          .getPratiqueOffres()
          .listen((event) => add(GetOffres(evenement: event)));
    });
    on<AskDevelopment>((event, emit) async {
      // await _offresub.cancel();
      _data
          .getOffres()
          .listen((event) => add(GetDevelopment(evenement: event)));
    });
    on<GetDevelopment>((event, emit) async {
      List<Offre> firstList = [];
      List<Offre> filtered = [];
      firstList = event.evenement!.docs.map((e) => offre.fromJson(e)).toList();
      firstList.forEach((element) {
        if (element.profile!.toLowerCase().contains("dévelop")) {
          filtered.add(element);
        }
      });
      emit(OffresReady(offres: filtered));
    });
    on<AskDesign>((event, emit) async {
      //await _offresub.cancel();

      _data.getOffres().listen((event) => add(GetDesign(evenement: event)));
    });
    on<GetDesign>((event, emit) {
      List<Offre> firstList = [];
      List<Offre> filtered = [];
      firstList = event.evenement!.docs.map((e) => offre.fromJson(e)).toList();
      firstList.forEach((element) {
        if (element.profile!.toLowerCase().contains("design")) {
          filtered.add(element);
        }
      });
      emit(OffresReady(offres: filtered));
    });
    on<AskData>((event, emit) async {
      //  await _offresub.cancel();

      _data.getOffres().listen((event) => add(GetData(evenement: event)));
    });
    on<GetData>((event, emit) {
      List<Offre> firstList = [];
      List<Offre> filtered = [];
      firstList = event.evenement!.docs.map((e) => offre.fromJson(e)).toList();
      firstList.forEach((element) {
        if (element.profile!.toLowerCase().contains("data")) {
          filtered.add(element);
        }
      });
      emit(OffresReady(offres: filtered));
    });
    on<AskUX>((event, emit) async {
      // await _offresub.cancel();

      _data.getOffres().listen((event) => add(GetUX(evenement: event)));
    });
    on<GetUX>((event, emit) {
      List<Offre> firstList = [];
      List<Offre> filtered = [];
      firstList = event.evenement!.docs.map((e) => offre.fromJson(e)).toList();
      firstList.forEach((element) {
        if ((element.profile!.contains("UX")) ||
            (element.profile!.contains("UI"))) {
          filtered.add(element);
        }
      });
      emit(OffresReady(offres: filtered));
    });
    on<AskResult>((event, emit) async {
      emit(OffresInitial());
      // await _offresub.cancel();
      _data.getOffres().listen(
          (evente) => add(GetResults(evenement: evente, result: event.res)));
    });
    on<GetResults>((event, emit) {
      List<Offre> firstList = [];
      List<Offre> filtered = [];
      firstList = event.evenement!.docs.map((e) => offre.fromJson(e)).toList();
      firstList.forEach((element) {
        if (element.profile!.toLowerCase() == event.result!.toLowerCase()) {
          filtered.add(element);
        }
      });
      emit(OffresReady(offres: filtered));
    });
  }
}
