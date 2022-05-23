import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Entreprise_bloc/Entreprise_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Favorites_bloc/Favorites_bloc.dart';
import 'package:s2ee_new/backend%20architecture/OffresBloc/Offres_bloc.dart';
import 'package:s2ee_new/backend%20architecture/Suggestions_Bloc/Suggestions_bloc.dart';
import "package:s2ee_new/config/theme.dart";
import "package:s2ee_new/views/routes/routes.dart";
import "package:s2ee_new/views/routes/routes_name.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(S2EEApp());
}

class S2EEApp extends StatelessWidget {
  @override
  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EntreprisesBloc()..add(AskEntrerprise()),
          lazy: false,
        ),
        BlocProvider(
            create: (context) => OffresBloc()..add(AskOffres()), lazy: false),
        BlocProvider(
            create: (context) => FavoritesBloc()..add(AskFavorites()),
            lazy: false),
        BlocProvider(create: (context) => SuggestionsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "S2EE",
        theme: AppTheme.defaultTheme,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: AppRoutes.choose,
      ),
    );
  }
}
