import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

class DashboardChartLoading extends StatelessWidget {
  const DashboardChartLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.white,
            direction: ShimmerDirection.ltr,
            period: const Duration(milliseconds: 1500),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              height: 285,
              width: MediaQuery.of(context).size.width,
              child: null,
            ))).animate().fade(
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
            );
  }
}
