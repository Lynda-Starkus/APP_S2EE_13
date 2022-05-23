import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Entreprise_bloc/Entreprise_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Favorites_bloc/Favorites_bloc.dart';
import 'package:s2ee_new/backend%20architecture/OffresBloc/Offres_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Suggestions_Bloc/Suggestions_bloc.dart';
import 'package:s2ee_new/config/colors.dart';

class Search extends SearchDelegate<String?> {
  String? tag;
  Search({this.tag})
      : super(
            searchFieldDecorationTheme:
                InputDecorationTheme(border: InputBorder.none));

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        primaryColor: AppColors.black,
        appBarTheme: AppBarTheme(elevation: 10),
        inputDecorationTheme: InputDecorationTheme(
            fillColor: AppColors.blackDeep,
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none));
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(
            Icons.clear,
            color: AppColors.white,
          ),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];
  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionBloc = BlocProvider.of<SuggestionsBloc>(context);
    switch (tag) {
      case "offres":
        return Container(
          color: AppColors.blackDeep,
          child: BlocBuilder(
              bloc: suggestionBloc..add(AskOffresSuggestion(suggestion: query)),
              builder: (BuildContext context, SuggestionsState state) {
                if (state is SuggestionsReady) {
                  return buildSuggestionsSuccess(context, state.suggestions);
                } else {
                  return buildNoSuggestions();
                }
              }),
        );
      case "entreprises":
        return Container(
          color: AppColors.blackDeep,
          child: BlocBuilder(
              bloc: suggestionBloc
                ..add(AskEntreprisesSuggestion(
                  suggestion: query,
                )),
              builder: (BuildContext context, SuggestionsState state) {
                if (state is SuggestionsReady) {
                  return buildSuggestionsSuccess(context, state.suggestions);
                } else {
                  return buildNoSuggestions();
                }
              }),
        );
      case "favorites":
        return Container(
          color: AppColors.blackDeep,
          child: BlocBuilder(
              bloc: suggestionBloc
                ..add(AskFavoritesSuggestion(
                  suggestion: query,
                )),
              builder: (BuildContext context, SuggestionsState state) {
                if (state is SuggestionsReady) {
                  return buildSuggestionsSuccess(context, state.suggestions);
                } else {
                  return buildNoSuggestions();
                }
              }),
        );
      default:
        return CircularProgressIndicator();
    }
  }

  Widget buildNoSuggestions() {
    return Center(
      child: Container(
        child: Text(
          'No suggestions!',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildSuggestionsSuccess(
      BuildContext context, List<String?> suggestions) {
    final offresBloc = BlocProvider.of<OffresBloc>(context);
    final entBloc = BlocProvider.of<EntreprisesBloc>(context);
    final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index]!;
        final queryText = suggestion.substring(0, query.length);
        final remainingText = suggestion.substring(query.length);

        return Container(
          color: AppColors.blackDeep,
          margin: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onTap: () {
              query = suggestion;
              switch (tag) {
                case "offres":
                  offresBloc.add(AskResult(query));
                  break;
                case "entreprises":
                  entBloc.add(AskEntrepriseResult(query));
                  break;
                case "favorites":
                  favoritesBloc.add(AskFavoritesResult(query));
              } // 1. Show Results
              close(context, null);
            },
            leading: Icon(Icons.location_city),
            title: RichText(
              text: TextSpan(
                text: queryText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
