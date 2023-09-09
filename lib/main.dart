import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_time_riverpod/firebase_options.dart';
import 'package:track_time_riverpod/src/features/onboarding/data/onboarding_repository.dart';
import 'package:track_time_riverpod/src/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final sharedPreferences = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      onboardingRepositoryProvider.overrideWithValue(
        OnboardingRepository(sharedPreferences: sharedPreferences),
      ),
    ],
  );
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gorRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: gorRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
