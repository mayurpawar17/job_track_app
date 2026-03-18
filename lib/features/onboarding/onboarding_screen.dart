import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_track_app/core/constants/app_colors.dart';
import 'package:job_track_app/features/onboarding/onboarding_first_screen.dart';
import 'package:job_track_app/features/onboarding/onboarding_second_screen.dart';
import 'package:job_track_app/features/onboarding/onboarding_third_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'bloc/onboarding_bloc.dart';
import 'bloc/onboarding_event.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) => setState(() => isLastPage = index == 2),
            children: [
              OnboardingFirstScreen(),
              // _buildPage(
              //   title: "Connect",
              //   subtitle: "Stay in touch with everyone.",
              // ),
              OnboardingSecondScreen(),
              // _buildPage(title: "Share", subtitle: "Send files with one tap."),
              OnboardingThirdScreen(),
              // _buildPage(title: "Secure", subtitle: "Your data is encrypted."),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip Button
            TextButton(
              onPressed: () => _pageController.jumpToPage(2),
              child: const Text("SKIP"),
            ),

            // The Indicator
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.primary,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),

            // Next/Done Button
            isLastPage
                ? ElevatedButton(
                    onPressed: () => context.read<OnboardingBloc>().add(
                      CompleteOnboarding(),
                    ),
                    child: const Text("DONE"),
                  )
                : IconButton(
                    onPressed: () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    ),
                    icon: const Icon(Icons.arrow_forward),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({required String title, required String subtitle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
