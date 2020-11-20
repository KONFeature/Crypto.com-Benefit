import 'package:crypto_benefit/app/presentation/modules/home/home.viewmodel.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/animations.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The widget for our home page
mixin HomeWidget {
  /// Our view model for the home page
  final vm = inject<HomeViewModel>();

  // Build our bottom nav bar
  BottomAppBar bottomBar(BuildContext context) => BottomAppBar(
        notchMargin: notchMargin,
        child: Observer(
          builder: (observableContext) => Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _appBarButtons(observableContext),
          ),
        ),
      );

  /// Get our app bars buttons
  List<Widget> _appBarButtons(BuildContext context) =>
      List.of([TabPages.import, TabPages.dashboard, TabPages.settings])
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
          opacity: vm.currentPage == page ? 1.0 : 0.3,
          duration: baseAnimationDuration,
          child: _buttonContentForPage(context, page),
        ),
      );

  /// Create the content of a button for a given pages
  Widget _buttonContentForPage(BuildContext context, TabPages page) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(page.icon),
          Text(
            page.title,
            style: Theme.of(context).textTheme.button,
          )
        ],
      );
}
