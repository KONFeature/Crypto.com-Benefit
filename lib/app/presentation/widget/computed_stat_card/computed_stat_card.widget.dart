import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/widget/base_card.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/computed_stat_card/computed_stat_header_hero.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/computed_stat_card/computed_stat_resume_hero.widget.dart';
import 'package:flutter/material.dart';

/// The widget for the computed stat card
class ComputedStatCardWidget extends StatelessWidget {
  // The computed stat we will display
  final ComputedStatistic computedStat;

  /// The callback when the user click on this card
  final VoidCallback onTap;

  const ComputedStatCardWidget({Key key, this.computedStat, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BaseCardWidget(
        onTap: onTap,
        children: [
          ComputedStatHeaderHeroWidget(
            computedStat: computedStat,
          ),
          ComputedStatResumeHeroWidget(
            computedStat: computedStat,
          ),
        ],
      );
}
