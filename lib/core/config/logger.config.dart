import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger extends Logger {
  AppLogger() : super(level: _getLogLevel());

  static Level _getLogLevel() {
    if (kDebugMode) {
      // If we are in debug mode
      return Level.verbose;
    } else if (kProfileMode) {
      // If we are in profile mode
      return Level.info;
    } else {
      // If we are in release mode or all other any mode
      return Level.warning;
    }
  }
}
