import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: shimmerBaseColor,
        highlightColor: highlightColor,
        child: child);
  }
}

Color shimmerBaseColor = const Color(0xfff3f3f3);
Color highlightColor = const Color(0xffd2d2d2);
