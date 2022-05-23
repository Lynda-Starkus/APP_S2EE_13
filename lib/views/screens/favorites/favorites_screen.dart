import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Favorites_bloc/Favorites_bloc.dart';
import 'package:s2ee_new/backend%20architecture/database_managment.dart';
import 'package:s2ee_new/config/colors.dart';
import 'package:s2ee_new/config/icons.dart';
import 'package:s2ee_new/views/components/components.dart';
import 'package:s2ee_new/views/routes/routes_name.dart';

class FavoritesScreen extends StatelessWidget {
  Data _data = new Data();

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(currentIndex: 3),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            ///AppBar
            SliverAppBar(
              snap: true,
              floating: true,
              backgroundColor: AppColors.blackDeep,
              leading: IconButton(
                icon: Icon(AppIcons.back, color: AppColors.white, size: 16.0),
                onPressed: () => Navigator.maybePop(context),
              ),
              actions: [
                IconButton(
                    icon:
                        Icon(Icons.logout, color: AppColors.white, size: 26.0),
                    onPressed: () async {
                      await _data.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.login, (route) => false);
                    }),
              ],
              bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SearchWidget(
                    tage: "favorites",
                    hint: "Search Favorites",
                  ),
                ),
                preferredSize: Size.fromHeight(80.0),
              ),
            ),

            ///Favorites List
            BlocBuilder(
                bloc: favoritesBloc,
                builder: (BuildContext context, FavoritesState state) {
                  if (state is FavoritesReady) {
                    return SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(height: 16.0),
                          ...List.generate(
                            state.favorites.length,
                            (index) => CompanyWidget(
                                index: index,
                                isFavorite: true,
                                entreprise: state.favorites[index]),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                        child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
