import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Entreprise_bloc/Entreprise_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Favorites_bloc/Favorites_bloc.dart';
import 'package:s2ee_new/config/config.dart';
import 'widgets/offers_count.dart';

class CompanyScreen extends StatelessWidget {
  final List<Object?> li;
  CompanyScreen({required this.li});
  @override
  Widget build(BuildContext context) {
    int index = li[0] as int;
    bool fav = li[1] as bool;
    final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    final entBloc = BlocProvider.of<EntreprisesBloc>(context);
    final _textTheme = Theme.of(context).textTheme;
    final _size = MediaQuery.of(context).size;
    FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    return fav
        ? BlocBuilder(
            bloc: favoritesBloc,
            builder: (BuildContext context, FavoritesState state) {
              if (state is FavoritesReady) {
                return SafeArea(
                  child: Scaffold(
                    body: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        ///App Bar
                        SliverAppBar(
                          snap: true,
                          floating: true,
                          backgroundColor: AppColors.blackDeep,
                          leading: SizedBox.shrink(),
                          bottom: PreferredSize(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ListTile(
                                leading: IconButton(
                                  icon: Icon(AppIcons.back,
                                      color: AppColors.white, size: 16.0),
                                  onPressed: () => Navigator.maybePop(context),
                                ),
                                title: Text(
                                  state.favorites[index].nom!,
                                  style: Theme.of(context).textTheme.button,
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      if (state.favorites[index].favorites!
                                          .contains(user!.uid)) {
                                        favoritesBloc.add(AskDeleteFavorites(
                                            entreprise:
                                                state.favorites[index]));
                                      } else {
                                        favoritesBloc.add(AskAddFavorites(
                                            entreprise:
                                                state.favorites[index]));
                                      }
                                    },
                                    icon: state.favorites[index].favorites!
                                            .contains(user!.uid)
                                        ? Icon(AppIcons.favorite,
                                            color: AppColors.white)
                                        : Icon(
                                            Icons.favorite_border,
                                            size: 34.0,
                                            color: AppColors.white,
                                          )),
                              ),
                            ),
                            preferredSize: Size.fromHeight(40.0),
                          ),
                        ),

                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              ///Details
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ///Logo
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 16.0, bottom: 8.0),
                                      height: 140.0,
                                      width: 140.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: CachedNetworkImageProvider(
                                            state.favorites[index].logo!,
                                          ),
                                        ),
                                      ),
                                    ),

                                    ///Company Name
                                    Text(
                                      state.favorites[index].nom!,
                                      style: _textTheme.headline3,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      state.favorites[index].description!,
                                      style: _textTheme.bodyText2,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 24.0),
                                    Row(
                                      children: [
                                        Icon(Icons.location_searching,
                                            color: AppColors.blackAccent),
                                        const SizedBox(width: 16.0),
                                        Flexible(
                                          child: Text(
                                            state.favorites[index].adresse!,
                                            style: TextStyle(
                                                color: AppColors.blackAccent),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30.0),

                                    /// stand & disponibility
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          child: SizedBox(
                                            height: 120.0,
                                            width: _size.width * 0.37,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 14.0),
                                                Text("Stand"),
                                                Text(
                                                  state.favorites[index].stand
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 50.0),
                                                ),
                                                const SizedBox(height: 4.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          child: SizedBox(
                                            height: 120.0,
                                            width: _size.width * 0.37,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 14.0),
                                                Text("Disponibilité"),
                                                Icon(Icons.check,
                                                    color: AppColors.teal,
                                                    size: 75.0),
                                                const SizedBox(height: 4.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30.0),

                                    ///Offers count
                                    OffersCountWidget(
                                        entreprise: state.favorites[index]),
                                    const SizedBox(height: 16.0),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SliverToBoxAdapter(child: CircularProgressIndicator());
              }
            })
        : BlocBuilder(
            bloc: entBloc,
            builder: (BuildContext context, EntreprisesState state) {
              if (state is EntreprisesReady) {
                return SafeArea(
                  child: Scaffold(
                    body: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        ///App Bar
                        SliverAppBar(
                          snap: true,
                          floating: true,
                          backgroundColor: AppColors.blackDeep,
                          leading: SizedBox.shrink(),
                          bottom: PreferredSize(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ListTile(
                                leading: IconButton(
                                  icon: Icon(AppIcons.back,
                                      color: AppColors.white, size: 16.0),
                                  onPressed: () => Navigator.maybePop(context),
                                ),
                                /* title: Text(
                                  state.entreprises[index].nom!,
                                  style: Theme.of(context).textTheme.button,
                                ),*/
                                trailing: IconButton(
                                    onPressed: () {
                                      if (state.entreprises[index].favorites!
                                          .contains(user!.uid)) {
                                        favoritesBloc.add(AskDeleteFavorites(
                                            entreprise:
                                                state.entreprises[index]));
                                      } else {
                                        favoritesBloc.add(AskAddFavorites(
                                            entreprise:
                                                state.entreprises[index]));
                                      }
                                    },
                                    icon: state.entreprises[index].favorites!
                                            .contains(user!.uid)
                                        ? Icon(AppIcons.favorite,
                                            color: AppColors.white)
                                        : Icon(
                                            Icons.favorite_border,
                                            size: 34.0,
                                            color: AppColors.white,
                                          )),
                              ),
                            ),
                            preferredSize: Size.fromHeight(40.0),
                          ),
                        ),

                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              ///Details
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ///Logo
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 16.0, bottom: 8.0),
                                      height: 140.0,
                                      width: 140.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: CachedNetworkImageProvider(
                                            state.entreprises[index].logo!,
                                          ),
                                        ),
                                      ),
                                    ),

                                    ///Company Name
                                    Text(
                                      state.entreprises[index].nom!,
                                      style: _textTheme.headline3,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      state.entreprises[index].description!,
                                      style: _textTheme.bodyText2,
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 24.0),
                                    Row(
                                      children: [
                                        Icon(Icons.location_searching,
                                            color: AppColors.blackAccent),
                                        const SizedBox(width: 16.0),
                                        Flexible(
                                          child: Text(
                                            state.entreprises[index].adresse!,
                                            style: TextStyle(
                                                color: AppColors.blackAccent),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30.0),

                                    /// stand & disponibility
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          child: SizedBox(
                                            height: 120.0,
                                            width: _size.width * 0.37,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 14.0),
                                                Text("Stand"),
                                                Text(
                                                  state.entreprises[index].stand
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 50.0),
                                                ),
                                                const SizedBox(height: 4.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          child: SizedBox(
                                            height: 120.0,
                                            width: _size.width * 0.37,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 14.0),
                                                Text("Disponibilité"),
                                                Icon(Icons.check,
                                                    color: AppColors.teal,
                                                    size: 75.0),
                                                const SizedBox(height: 4.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30.0),

                                    ///Offers count
                                    OffersCountWidget(
                                        entreprise: state.entreprises[index]),
                                    const SizedBox(height: 16.0),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SliverToBoxAdapter(child: CircularProgressIndicator());
              }
            });
  }
}
