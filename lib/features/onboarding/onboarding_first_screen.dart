import 'package:flutter/material.dart';
import 'package:job_track_app/core/constants/app_gap.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTopBar(),
          const Spacer(),
          _buildIllustration(),
          const Spacer(),
          _buildTextContent(),
          AppGap.s32,
          // _buildPageIndicator(),
          // const SizedBox(height: 32),
          // _buildNextButton(),
          // const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.work, color: Color(0xFF003EB3), size: 28),
            const SizedBox(width: 8),
            Text(
              'JobTrack',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001D4D),
              ),
            ),
          ],
        ),
        // TextButton(
        //   onPressed: () {},
        //   child: Text(
        //     'Skip',
        //     style: TextStyle(color: Colors.grey[600], fontSize: 16),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildIllustration() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Card (Light Blue)
          Positioned(
            top: 40,
            child: _cardSkeleton(
              width: 280,
              height: 80,
              badge: 'APPLIED',
              badgeColor: Color(0xFFD6E4FF),
              textColor: Color(0xFF003EB3),
            ),
          ),
          // Middle Cards
          Positioned(
            top: 130,
            left: 40,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Color(0xFFDFFFEF),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          // Bottom Card (Green Badge)
          Positioned(
            bottom: 40,
            child: _cardSkeleton(
              width: 280,
              height: 50,
              badge: 'INTERVIEW',
              badgeColor: Color(0xFF9FFFCB),
              textColor: Color(0xFF008040),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardSkeleton({
    required double width,
    required double height,
    required String badge,
    required Color badgeColor,
    required Color textColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFFE8EFFF),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 50,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              badge,
              style: TextStyle(
                color: textColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      children: [
        Text(
          'Track your job\napplications',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Color(0xFF001D4D),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Save every job you apply to in\none place. Stay organized and\nnever miss a follow-up.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueGrey[600],
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 8,
          decoration: BoxDecoration(
            color: Color(0xFF004ECC),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Color(0xFFD6E4FF),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Color(0xFFD6E4FF),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF004ECC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
