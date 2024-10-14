import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/empty_state.svg',
          width: 200.0,
        ),
        const SizedBox(height: 12.0),
        const Text('Your task list is empty'),
        const SizedBox(height: 120.0),
      ],
    ).animate(
      effects: [
        FadeEffect(delay: 500.ms),
      ],
    );
  }
}
