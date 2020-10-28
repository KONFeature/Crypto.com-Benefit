import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmerWidget extends StatelessWidget {
  final Widget child;

  const BaseShimmerWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      child: child,
      baseColor: Theme.of(context).backgroundColor,
      highlightColor: Theme.of(context).cardColor);
}
