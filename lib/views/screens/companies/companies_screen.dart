import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Entreprise_bloc/Entreprise_bloc.dart';
import 'package:s2ee_new/backend%20architecture/database_managment.dart';
import 'package:s2ee_new/config/colors.dart';
import 'package:s2ee_new/config/icons.dart';
import 'package:s2ee_new/views/components/components.dart';
import 'package:s2ee_new/views/routes/routes_name.dart';

class CompaniesScreen extends StatelessWidget {
  Data _data = new Data();
  @override
  Widget build(BuildContext context) {
    final entBloc = BlocProvider.of<EntreprisesBloc>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
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
                preferredSize: Size.fromHeight(130.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      /// Search Wiget
                      SearchWidget(
                        tage: "entreprises",
                        hint: "Search Entreprises",
                      ),

                      /// Intership List
                      IntershipListWidget(tag: "entreprise"),

                      /// Companies Types
                    ],
                  ),
                ),
              ),
            ),

            ///Favorites List
            BlocBuilder(
                bloc: entBloc,
                builder: (BuildContext context, EntreprisesState state) {
                  if (state is EntreprisesReady) {
                    return SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(height: 16.0),
                          ...List.generate(
                            state.entreprises.length,
                            (index) => CompanyWidget(
                                index: index,
                                isFavorite: false,
                                entreprise: state.entreprises[index]),
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
