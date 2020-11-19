import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_spot.dart';
import 'package:mobx/mobx.dart';

part 'stat_detail.viewmodel.g.dart';

class StatDetailViewModel = _StatDetailViewModelBase with _$StatDetailViewModel;

/// The view model for our statistic detail view model.
abstract class _StatDetailViewModelBase with Store {}
