import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

/// The view model for our import file view.
abstract class _HomeViewModelBase with Store {

  /// Get the icon of a given page
  IconData getIconForPage(TabPages page) {
    switch (page) {
      case TabPages.import:
        return Icons.file_upload;
      case TabPages.transactions:
      default:
        return Icons.credit_card;
    }
  }

  /// Get the title of a given page
  String getTitleForPage(TabPages page) {
    switch (page) {
      case TabPages.import:
        return 'Import';
      case TabPages.transactions:
      default:
        return 'Transactions';
    }
  }
}

/// Enum of the different pages we got
enum TabPages {
  dashboard,
  import,
  transactions,
}
