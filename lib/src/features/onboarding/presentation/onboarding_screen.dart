import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:track_time_riverpod/src/constants/app_sizes.dart';
import 'package:track_time_riverpod/src/features/onboarding/presentation/onboarding_controller.dart';
import 'package:track_time_riverpod/src/routing/app_router.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Track your time\nBecause time counts',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            gapH16,
            SvgPicture.asset(
              'assets/time-tracking.svg',
              height: 200,
              width: 200,
              semanticsLabel: 'Time tracking logo',
            ),
            gapH16,
            ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () async {
                      await ref
                          .read(onboardingControllerProvider.notifier)
                          .completeOnboarding();
                      if (context.mounted) {
                        context.goNamed(AppRoute.signIn.name);
                      }
                    },
              child: Text(
                'Get started',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
