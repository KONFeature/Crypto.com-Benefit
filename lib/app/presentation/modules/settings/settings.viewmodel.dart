import 'package:crypto_benefit/app/domain/usecases/settings/watch_statistics.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'settings.viewmodel.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

/// The view model for our settings page.
abstract class _SettingsViewModelBase with Store {
  /// The use case used to listen to all statistics
  final _watchStatisticsUseCase = inject<WatchStatisticsUseCase>();

  @observable
  ObservableStream<List> _statistics;

  @computed
  bool get isLoading => _statistics.status == StreamStatus.waiting;

  @computed
  List get transactions => _statistics.value;

  _SettingsViewModelBase() {
    _statistics = _watchStatisticsUseCase.watch(null).asObservable();
  }
}
