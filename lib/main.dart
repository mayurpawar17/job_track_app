import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_track_app/features/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/onboarding/bloc/onboarding_bloc.dart';
import 'features/onboarding/bloc/onboarding_event.dart';
import 'features/onboarding/bloc/onboarding_state.dart';
import 'features/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    BlocProvider(
      create: (context) => OnboardingBloc(prefs)..add(CheckOnboardingStatus()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          if (state is OnboardingCompleted) {
            return const HomeScreen();
          } else if (state is ShowOnboarding) {
            return const OnboardingScreen();
          }
          // Show a loader while checking SharedPreferences
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
