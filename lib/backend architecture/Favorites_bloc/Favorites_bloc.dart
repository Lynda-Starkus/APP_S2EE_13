import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/database_managment.dart';
import 'package:s2ee_new/backend%20architecture/models/Entreprise.dart';

part 'Favorites_events.dart';
part 'Favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvents, FavoritesState> {
  // late StreamSubscription _favoritesub;
  final Data _data = new Data();
  final Entreprise entreprise = new Entreprise();

  FavoritesBloc() : super(FavoritesInitial()) {
    on<AskFavorites>((event, emit) async {
      try {
        //await _favoritesub.cancel();
        _data.showFavorite()!.listen((event) {
          add(GetFavorites(evenement: event));
        });
      } catch (e) {
        print(e.toString());
      }
    });
    on<GetFavorites>((event, emit) {
      emit(FavoritesReady(
          favorites: event.evenement!.docs
              .map((snapshot) => entreprise.fromJson(snapshot))
              .toList()));
    });
    on<AskAddFavorites>((event, emit) async {
      await _data.addFavorite(event.entreprise!);
    });
    on<AskDeleteFavorites>((event, emit) async {
      await _data.deleteFavorite(event.entreprise!);
    });
    on<AskFavoritesResult>((event, emit) async {
      //  await _favoritesub.cancel();
      _data.showFavorite()!.listen(
          (evente) => add(GetResults(evenement: evente, result: event.res)));
    });
    on<GetResults>((event, emit) async {
      List<Entreprise> firstList = [];
      List<Entreprise> filtered = [];
      firstList =
          event.evenement!.docs.map((e) => entreprise.fromJson(e)).toList();
      firstList.forEach((element) {
        if (element.nom!.toLowerCase() == event.result!.toLowerCase()) {
          filtered.add(element);
        }
      });
      emit(FavoritesInitial());
      emit(FavoritesReady(favorites: filtered));
    });
  }
}
