import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.page.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.widget.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home_page_route.widget.dart';
import 'package:crypto_benefit/app/presentation/modules/import/import.page.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/settings.page.dart';
import 'package:crypto_benefit/app/presentation/modules/stat_detail/stat_detail.page.dart';
import 'package:crypto_benefit/core/config/routes.config.dart';
import 'package:flutter/material.dart';

/// The home page
class HomePage extends StatelessWidget with HomeWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
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
      case CryptoBenefitRoutes.statisticDetail:
        builder = (context) => StatDetailPage();
        return AppPageRoute(builder: builder, settings: settings, fullscreenDialog: true);
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return AppPageRoute(builder: builder, settings: settings);
  }
}
