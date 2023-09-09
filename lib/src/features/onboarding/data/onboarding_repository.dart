import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_repository.g.dart';

class OnboardingRepository {
  final SharedPreferences sharedPreferences;

  OnboardingRepository({required this.sharedPreferences});

  static const onboardingCompleteKey = 'onboardingComplete';

  Future<void> setOnboardingComplete() async {
    await sharedPreferences.setBool(onboardingCompleteKey, true);
  }

  bool isOnboardingComplete() {
    print('reading shared preferences');
    return sharedPreferences.getBool(onboardingCompleteKey) ?? false;
  }
}

@Riverpod(keepAlive: true)
OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  print("unimplemented");
  throw UnimplementedError();
}
