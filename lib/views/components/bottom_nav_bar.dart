import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Entreprise_bloc/Entreprise_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Favorites_bloc/Favorites_bloc.dart';
import 'package:s2ee_new/backend%20architecture/OffresBloc/Offres_bloc.dart';
import 'package:s2ee_new/config/icons.dart';
import 'package:s2ee_new/views/routes/routes_name.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BottomNavigationBar(
        onTap: (index) => _onTap(index, context),
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(AppIcons.building), label: "Entreprise"),
          BottomNavigationBarItem(icon: Icon(AppIcons.offer), label: "Offre"),
          BottomNavigationBarItem(icon: Icon(AppIcons.heart), label: "favoris"),
        ],
      ),
    );
  }

  void _onTap(int index, BuildContext context) {
    final entBloc = BlocProvider.of<EntreprisesBloc>(context);
    final offresBloc = BlocProvider.of<OffresBloc>(context);
    final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    if (index != currentIndex) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, AppRoutes.home);
          break;
        case 1:
          entBloc.add(AskEntrerprise());

          Navigator.pushNamed(context, AppRoutes.companies);
          break;
        case 2:
          offresBloc.add(AskOffres());

          Navigator.pushNamed(context, AppRoutes.offers);

          break;
        case 3:
          favoritesBloc.add(AskFavorites());
          Navigator.pushNamed(context, AppRoutes.favorites);
          break;
        default:
          break;
      }
    }
  }
}
