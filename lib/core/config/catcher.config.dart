import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';

/// Setup catcher, for all the exceptions handling
void setupCatcherAndRun(StatelessWidget root) {
  // Create the config options
  CatcherOptions debugOptions =
      CatcherOptions(PageReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["quentin@nivelais.com"]),
    ToastHandler()
  ]);
  Catcher(
      rootWidget: root,
      debugConfig: debugOptions,
      releaseConfig: releaseOptions);
}
