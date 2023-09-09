import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:track_time_riverpod/src/features/authentication/presentation/custom_sign_in_screen.dart';
import 'package:track_time_riverpod/src/features/onboarding/data/onboarding_repository.dart';
import 'package:track_time_riverpod/src/features/onboarding/presentation/onboarding_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  onboarding,
  signIn,
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final onboardingRepository = ref.watch(onboardingRepositoryProvider);
  return GoRouter(
    initialLocation: '/signIn',
    debugLogDiagnostics: false,
    redirect: ((context, state) {
      final didCompleteOnboarding = onboardingRepository.isOnboardingComplete();

      if (!didCompleteOnboarding) {
        if (state.matchedLocation != '/onboarding') {
          return '/onboarding';
        }
        return null;
      }
      return null;
    }),
    routes: [
      GoRoute(
        path: '/onboarding',
        name: AppRoute.onboarding.name,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: OnboardingScreen()),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: CustomSignInScreen()),
      ),
    ],
  );
}
