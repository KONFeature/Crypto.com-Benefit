
# Crypto statistics

Statistics generator for crypto.com transactions, of all sorts (fiat, wallet, or card).

It use the CSV export generated from the Crypto.com, and then you can import them inside the app via the 'import' screen.

After that, in the 'settings' page, you can create your own statistic, based on the type of the transaction, and on it's kind.

When you have all setup based on your preferences, you can see a quick resume of your different statistic in the dashboard page, and clicking on them will open you the detail of this statistics.

The goal of this application is to get a rapid analysis of your crypto.com benefit, and the differente sources of this beneif

## Technical part

This app is developed using Flutter and respecting the clean architecture pattern.

### Libraries used

All the main flutter libraries used for this app

 - [get_it](https://pub.dev/packages/get_it), for the dependency injection
 - [mobx](https://pub.dev/packages/mobx), to ease the reactivness of the view and all the state managment related logic
 - [catcher](https://pub.dev/packages/catcher), application wide error handling
 - [rxdart](https://pub.dev/packages/rxdart), provide some usefull extensions function for the stream and the observable
 - [moor](https://pub.dev/packages/moor), for the database
 - [csv](https://pub.dev/packages/csv), ease the csv file parsing
 - [path_provider](https://pub.dev/packages/path_provider), access file stored on the phone
 - [flutter_document_picker](https://pub.dev/packages/flutter_document_picker), let the user pick a document from it's device
 - [shimmer](https://pub.dev/packages/shimmer), smooth shimming effect, used as loading indicator
 - [fl_chart](https://pub.dev/packages/fl_chart), dynamic and highly customizable chart
 - [expandable](https://pub.dev/packages/expandable), provide some simple expandable container
