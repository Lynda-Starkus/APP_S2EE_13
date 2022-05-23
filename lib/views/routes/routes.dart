import 'package:flutter/cupertino.dart';

import '../screens/ChooseScreen/ChooseScreen.dart';
import 'routes_name.dart';

import '../screens/screens.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // login
      case AppRoutes.login:
        return _pageSimpleRoute(LoginScreen(), settings);

      // home
      case AppRoutes.home:
        return _pageSimpleRoute(HomeScreen(), settings);

      /// notifications
      case AppRoutes.notifications:
        return _pageAnimatedRoute(NotificationScreen(), settings);

      // favorites
      case AppRoutes.favorites:
        return _pageSimpleRoute(FavoritesScreen(), settings);

      // Entreprises
      case AppRoutes.companies:
        return _pageSimpleRoute(CompaniesScreen(), settings);

      // Offres
      case AppRoutes.offers:
        return _pageSimpleRoute(OfferScreen(), settings);

      /// Entreprise
      case AppRoutes.company:
        return _pageAnimatedRoute(
            CompanyScreen(li: settings.arguments as List<Object?>), settings);
      case AppRoutes.choose:
        return _pageAnimatedRoute(ChooseScreen(), settings);

      /// default
      default:
        return _pageAnimatedRoute(HomeScreen(), settings);
    }
  }

  /// Create Custom Transition for Navigation
  static Route<dynamic> _pageAnimatedRoute(
      Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  /// Navigation Without Transition (Animtaion)
  static Route<dynamic> _pageSimpleRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, _, __) => page,
    );
  }

  // ///Navigation With IOS Transition
  // static Route<dynamic> _pageCupertino(Widget page, RouteSettings settings) {
  //   return CupertinoPageRoute(builder: (_) => page, settings: settings);
  // }
}
