import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.page.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.widget.dart';
import 'package:crypto_benefit/app/presentation/modules/import/import.page.dart';
import 'package:crypto_benefit/app/presentation/modules/transactions/transactions.page.dart';
import 'package:crypto_benefit/core/values/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeWidget {
  /// Key for our scaffold object.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  /// The current page on wich the user is (don't use observer for this)
  TabPages _currentPage = TabPages.dashboard;

  /// The map this will contains our widget by tab pages
  Map<TabPages, Widget> _pageToWidgetMap = Map();

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      extendBody: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: fab(context),
      bottomNavigationBar: bottomBar(context),
      body: _body);

  /// The main body of the app.
  Widget get _body => SafeArea(
        child: AnimatedSwitcher(
          duration: baseAnimationDuration,
          child: _currentScreen(_currentPage),
        ),
      );

  /// Get the current widget to display
  Widget _currentScreen(TabPages tabPage) {
    // If we havn't created a widget yet we do it
    if (!_pageToWidgetMap.containsKey(tabPage)) {
      Widget newPageWidget;
      switch (tabPage) {
        case TabPages.import:
          newPageWidget = ImportPage();
          break;
        case TabPages.transactions:
          newPageWidget = TransactionsPage();
          break;
        case TabPages.dashboard:
        default:
          newPageWidget = DashboardPage();
          break;
      }
      _pageToWidgetMap[tabPage] = newPageWidget;
    }
    // Then return it
    return _pageToWidgetMap[tabPage];
  }

  @override
  void onTabSelected(TabPages tabPage) => setState(() {
        _currentPage = tabPage;
      });

  @override
  bool isCurrentTab(TabPages tabPage) => _currentPage == tabPage;
}
