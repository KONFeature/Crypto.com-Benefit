import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.page.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.widget.dart';
import 'package:crypto_benefit/app/presentation/modules/import/import.page.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/settings.page.dart';
import 'package:crypto_benefit/core/config/routes.config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with HomeWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      extendBody: false,
      bottomNavigationBar: bottomBar(context),
      body: _body(context));

  /// The main body of the app.
  Widget _body(BuildContext context) => SafeArea(
          child: Navigator(
        key: vm.navigatorKey,
        initialRoute: CryptoBenefitRoutes.home,
        onGenerateRoute: (settings) => _generateRoute(context, settings),
      ));

  // Create the page for a given route
  PageRoute _generateRoute(BuildContext context, RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case CryptoBenefitRoutes.home:
        builder = (context) => DashboardPage();
        break;
      case CryptoBenefitRoutes.import:
        builder = (context) => ImportPage();
        break;
      case CryptoBenefitRoutes.settings:
        builder = (context) => SettingsPage();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
