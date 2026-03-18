import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final SharedPreferences prefs;

  OnboardingBloc(this.prefs) : super(OnboardingInitial()) {
    on<CheckOnboardingStatus>((event, emit) {
      final bool seen = prefs.getBool('seenOnboarding') ?? false;
      if (seen) {
        emit(OnboardingCompleted());
      } else {
        emit(ShowOnboarding());
      }
    });

    on<CompleteOnboarding>((event, emit) async {
      await prefs.setBool('seenOnboarding', true);
      emit(OnboardingCompleted());
    });
  }
}
