import 'package:crypto_benefit/core/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

/// The view model for our import file view.
abstract class _HomeViewModelBase with Store {
  /// Key for our navgator object.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// The current tab page displayed
  TabPages _currentPage = TabPages.dashboard;

  /// Get the icon of a given page
  IconData getIconForPage(TabPages page) {
    switch (page) {
      case TabPages.import:
        return Icons.file_upload;
      case TabPages.settings:
      default:
        return Icons.settings;
    }
  }

  /// Get the title of a given page
  String getTitleForPage(TabPages page) {
    switch (page) {
      case TabPages.import:
        return 'Import';
      case TabPages.settings:
      default:
        return 'Settings';
    }
  }

  /// Perform the right action when a bottom button is clicked
  void onTabPageClicked(TabPages page) {
    print('Asking to change page for $page');
    // If we are already on this page we don't push a new route
    if (page == _currentPage)
      return;
    else
      _currentPage = page;
    // When a tab is clicked send the name to display to the navigator
    navigatorKey.currentState.pushNamed(_getRouteForPage(page));
  }

  /// Check if a page is the currently displayed one
  bool isCurrentPage(TabPages page) => _currentPage == page;

  /// Get the route for a given
  String _getRouteForPage(TabPages page) {
    switch (page) {
      case TabPages.import:
        return CryptoBenefitRoutes.import;
      case TabPages.settings:
        return CryptoBenefitRoutes.settings;
      case TabPages.dashboard:
      default:
        return CryptoBenefitRoutes.home;
    }
  }
}

/// Enum of the different pages we got
enum TabPages {
  dashboard,
  import,
  settings,
}
