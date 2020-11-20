import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/delete_statistic.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/watch_statistics.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'settings.viewmodel.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

/// The view model for our settings page.
abstract class _SettingsViewModelBase with Store {
  /// The use case used to listen to all statistics
  final _watchStatisticsUseCase = inject<WatchStatisticsUseCase>();

  /// The use case to delete a statistic
  final _deleteStatisticUseCase = inject<DeleteStatisticUseCase>();

  ObservableStream<List> _statisticsStream;

  @computed
  bool get isLoading => _statisticsStream.status == StreamStatus.waiting;

  @computed
  List<Statistic> get statistics => _statisticsStream.value;

  _SettingsViewModelBase() {
    _statisticsStream = _watchStatisticsUseCase.watch(null).asObservable();
  }

  /// Function call to delete a statistic
  void deleteStatistic(Statistic statistic) {
    _deleteStatisticUseCase
        .execute(DeleteStatisticParams(statistic: statistic));
  }
}
