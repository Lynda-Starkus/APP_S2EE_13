import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Favorites_bloc/Favorites_bloc.dart';
import 'package:s2ee_new/backend%20architecture/database_managment.dart';
import 'package:s2ee_new/backend%20architecture/models/Entreprise.dart';
import 'package:s2ee_new/config/colors.dart';
import 'package:s2ee_new/config/icons.dart';
import 'package:s2ee_new/views/routes/routes_name.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'circle.dart';

class CompanyWidget extends StatelessWidget {
  final bool? isFavorite;
  Entreprise? entreprise;
  final int? index;
  CompanyWidget({this.isFavorite, this.entreprise, this.index});

  final Data _data = new Data();

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    final _textTheme = Theme.of(context).textTheme;
    FirebaseAuth _auth = FirebaseAuth.instance;
    final User user = _auth.currentUser!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, AppRoutes.company,
            arguments: [index, isFavorite]),
        child: Card(
          child: Container(
            height: 180.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    contentPadding: const EdgeInsets.all(0.0),
                    leading: CachedNetworkImage(
                      fit: BoxFit.contain,
                      height: 45,
                      width: 45,
                      imageUrl: entreprise!.logo!,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    title: Text(
                      entreprise!.nom!,
                      style: _textTheme.subtitle1!.apply(fontWeightDelta: 3),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      entreprise!.type!,
                      style: _textTheme.subtitle2,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: entreprise!.favorites!.contains(user.uid)
                          ? Icon(AppIcons.favorite, color: AppColors.white)
                          : Icon(Icons.favorite_border, size: 36.0),
                      onPressed: () {
                        if (entreprise!.favorites!.contains(user.uid)) {
                          favoritesBloc
                              .add(AskDeleteFavorites(entreprise: entreprise));
                        } else {
                          favoritesBloc
                              .add(AskAddFavorites(entreprise: entreprise));
                        }
                      },
                    )),
                Spacer(),
                Row(
                  children: [
                    CustomCircle(color: AppColors.teal),
                    CustomCircle(color: AppColors.blue),
                    CustomCircle(color: AppColors.green, filled: false),
                    CustomCircle(color: AppColors.white, filled: false),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.teal,
                      ),
                      width: 120.0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "LOCATION",
                            style: TextStyle(
                                color: AppColors.white, fontSize: 14.0),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.white,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
