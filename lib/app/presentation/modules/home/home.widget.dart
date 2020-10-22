import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.page.dart';
import 'package:crypto_benefit/app/presentation/modules/import/import.page.dart';
import 'package:crypto_benefit/app/presentation/modules/transactions/transactions.page.dart';
import 'package:crypto_benefit/core/config/routes.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/animations.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.viewmodel.dart';

/// The widget of the import pages
mixin HomeWidget {
  /// Our view model for the home page
  final vm = inject<HomeViewModel>();

  // Build our bottom nav bar
  BottomAppBar bottomBar(BuildContext context) => BottomAppBar(
        notchMargin: notchMargin,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _appBarButtons(context),
        ),
      );

  // Build our fab to access the dashboard
  FloatingActionButton fab(BuildContext context) =>
      FloatingActionButton.extended(
          icon: const Icon(Icons.dashboard),
          label: const Text('Dashboard'),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            vm.onTabPageClicked(TabPages.dashboard);
          });

  /// Get our app bars buttons
  List<Widget> _appBarButtons(BuildContext context) =>
      List.of([TabPages.import, TabPages.transactions])
          .map((tabPage) => _buttonForPage(context, tabPage))
          .toList();

  /// Get the right icon for the given page.
  Widget _buttonForPage(BuildContext context, TabPages page) => MaterialButton(
      padding: EdgeInsets.all(margin),
      onPressed: () {
        // Send the event to the view model
        vm.onTabPageClicked(page);
      },
      child: AnimatedOpacity(
        opacity: vm.isCurrentPage(page) ? 1.0 : 0.3,
        duration: baseAnimationDuration,
        child: _buttonContentForPage(context, page),
      ));

  /// Create the content of a button for a given pages
  Widget _buttonContentForPage(BuildContext context, TabPages page) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(vm.getIconForPage(page)),
            Text(
              vm.getTitleForPage(page),
              style: Theme.of(context).textTheme.button,
            )
          ]);

  // Create the page for a given route
  PageRoute generateRoute(BuildContext context, RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case CryptoBenefitRoutes.home:
        builder = (context) => DashboardPage();
        break;
      case CryptoBenefitRoutes.import:
        builder = (context) => ImportPage();
        break;
      case CryptoBenefitRoutes.transactions:
        builder = (context) => TransactionsPage();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
