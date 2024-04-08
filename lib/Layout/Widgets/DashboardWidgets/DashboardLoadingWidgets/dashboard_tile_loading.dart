import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

class DashboardMainTileLoading extends StatelessWidget {
  const DashboardMainTileLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.white,
            direction: ShimmerDirection.ltr,
            period: const Duration(milliseconds: 1500),
            child: Container(
              width: 190,
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              child: const Padding(padding: EdgeInsets.all(16.0), child: null),
            ))
        .animate()
        .fade(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300));
  }
}
