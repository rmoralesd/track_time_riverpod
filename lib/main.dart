import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:track_time_riverpod/firebase_options.dart';
import 'package:track_time_riverpod/src/routing/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final gorRouter = goRouter();
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
