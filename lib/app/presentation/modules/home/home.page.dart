import 'package:crypto_benefit/app/presentation/modules/home/home.widget.dart';
import 'package:crypto_benefit/core/config/routes.dart';
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
          child: Navigator(
        key: vm.navigatorKey,
        initialRoute: CryptoBenefitRoutes.home,
        onGenerateRoute: (settings) => generateRoute(context, settings),
      ));
}
