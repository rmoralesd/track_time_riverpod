import 'package:go_router/go_router.dart';
import 'package:track_time_riverpod/src/features/onboarding/presentation/authentication/presentation/custom_sign_in_screen.dart';
import 'package:track_time_riverpod/src/features/onboarding/presentation/onboarding_screen.dart';

enum AppRoute {
  onboarding,
  signIn,
}

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/signIn',
    debugLogDiagnostics: false,
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
