import 'package:crypto_benefit/core/app.dart';
import 'package:crypto_benefit/core/config/catcher.config.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

void main() async {
  setupInjection();

  final app = App();
  setupCatcherAndRun(app);
}
