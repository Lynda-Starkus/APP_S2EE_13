import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/OffresBloc/Offres_bloc.dart';
import 'package:s2ee_new/backend%20architecture/database_managment.dart';
import 'package:s2ee_new/config/config.dart';
import 'package:s2ee_new/views/components/components.dart';
import 'package:s2ee_new/views/routes/routes_name.dart';

import '../../../backend architecture/database_managment.dart';
import 'widgets/offers_list.dart';

class OfferScreen extends StatelessWidget {
  Data _data = new Data();
  @override
  Widget build(BuildContext context) {
    final offresBloc = BlocProvider.of<OffresBloc>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(currentIndex: 2),
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
                    })
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(190.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      /// Search Wiget
                      SearchWidget(
                        tage: "offres",
                        hint: "Search Offres",
                      ),

                      /// Intership List
                      IntershipListWidget(tag: "offre"),

                      /// Offers Types
                      OffersListWidget(tag: "offre type")
                    ],
                  ),
                ),
              ),
            ),

            BlocBuilder(
                bloc: offresBloc,
                builder: (BuildContext context, OffresState state) {
                  if (state is OffresReady) {
                    return SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(height: 16.0),
                          ...List.generate(
                            state.offres.length,
                            (index) => OfferWidget(offer: state.offres[index]),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                        child: CircularProgressIndicator());
                  }
                }),

            ///Favorites List
          ],
        ),
      ),
    );
  }
}
