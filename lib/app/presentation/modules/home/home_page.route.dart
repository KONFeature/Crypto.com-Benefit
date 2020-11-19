import 'package:flutter/material.dart';

// Representing a route for the home page
class HomePageRoute extends MaterialPageRoute<String> {
  HomePageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    maintainState = true,
    fullscreenDialog = false,
  }) : super(
          settings: settings,
          fullscreenDialog: fullscreenDialog,
          builder: builder,
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 2000);
}
