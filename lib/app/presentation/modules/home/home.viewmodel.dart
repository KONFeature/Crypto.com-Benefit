import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/core/config/routes.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

/// The view model for our home page.
abstract class _HomeViewModelBase with Store {
  /// Key for our navigator widget.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// The current tab page displayed
  @observable
  TabPages _currentPage = TabPages.dashboard;

  @computed
  TabPages get currentPage => _currentPage;

  /// Perform the right action when a bottom button is clicked
  @action
  void onTabPageClicked(TabPages page) {
    print('Navigating to page $page');
    // If we are already on this page we don't push a new route
    if (page == _currentPage)
      return;
    else
      _currentPage = page;
    // When a tab is clicked send the name to display to the navigator
    navigatorKey.currentState.pushNamed(page.route);
  }

  /// go to the statistic detail page
  void goToStatDetail(ComputedStatistic computedStat) {
    navigatorKey.currentState.pushNamed(
      CryptoBenefitRoutes.statisticDetail,
      arguments: computedStat,
    );
  }
}

/// Enum of the different pages we got
enum TabPages {
  dashboard,
  import,
  settings,
}

/// Extension to get the displayable text and icon of our tab pages
extension TabPagesExtension on TabPages {
  // Get the icon for our pages
  IconData get icon {
    switch (this) {
      case TabPages.import:
        return Icons.file_upload;
      case TabPages.dashboard:
        return Icons.dashboard;
      case TabPages.settings:
      default:
        return Icons.settings;
    }
  }

  // Get the title for our pages
  String get title {
    switch (this) {
      case TabPages.import:
        return 'Import';
      case TabPages.dashboard:
        return 'Dashboard';
      case TabPages.settings:
      default:
        return 'Settings';
    }
  }

  // Get the route for our pages
  String get route {
    switch (this) {
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
