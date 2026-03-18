import 'package:flutter/material.dart';

import '../../core/constants/app_gap.dart';

class OnboardingSecondScreen extends StatelessWidget {
  const OnboardingSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  _buildOverlappingCards(),
                  const Spacer(),
                  _buildTextSection(),
                  AppGap.s32,
                  // _buildPageIndicator(),
                  // AppGap.s32,
                  // _buildBottomButtons(),
                  // AppGap.s32,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverlappingCards() {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Senior Product Designer Card (Top Left)
          Positioned(
            top: 40,
            left: 20,
            child: _jobCard(
              title: "Senior Product Designer",
              company: "Linear",
              status: "APPLIED",
              time: "2d ago",
              statusColor: const Color(0xFFD6E4FF),
              textColor: const Color(0xFF003EB3),
            ),
          ),
          // Lead UI Engineer Card (Middle Right)
          Positioned(
            top: 130,
            right: 20,
            child: _jobCard(
              title: "Lead UI Engineer",
              company: "Stripe",
              status: "INTERVIEW",
              time: "Today",
              statusColor: const Color(0xFF9FFFCB),
              textColor: const Color(0xFF008040),
            ),
          ),
          // UX Researcher Card (Bottom Left)
          Positioned(
            top: 220,
            left: 50,
            child: _jobCard(
              title: "UX Researcher",
              company: "Airbnb",
              status: "OFFER",
              time: "Just now",
              statusColor: const Color(0xFFD6E4FF),
              textColor: const Color(0xFF003EB3),
            ),
          ),
          // Rejected Card (Peeking at the bottom)
          Positioned(
            bottom: -10,
            left: 30,
            child: Opacity(
              opacity: 0.4,
              child: _jobCard(
                title: "Creative Director",
                company: "",
                status: "REJECTED",
                time: "",
                statusColor: const Color(0xFFFFD6D6),
                textColor: const Color(0xFFB30000),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _jobCard({
    required String title,
    required String company,
    required String status,
    required String time,
    required Color statusColor,
    required Color textColor,
  }) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                time,
                style: TextStyle(color: Colors.grey[400], fontSize: 11),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF001D4D),
            ),
          ),
          if (company.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              company,
              style: TextStyle(fontSize: 14, color: Colors.blueGrey[400]),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Column(
      children: [
        const Text(
          'Stay organized',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Color(0xFF001D4D),
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 17,
              color: Colors.blueGrey[600],
              height: 1.5,
            ),
            children: const [
              TextSpan(text: "Track status like "),
              TextSpan(
                text: "Applied",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(text: ", "),
              TextSpan(
                text: "Interview",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(text: ",\n"),
              TextSpan(
                text: "Offer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(text: ", or "),
              TextSpan(
                text: "Rejected",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(text: "."),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot(isActive: false),
        const SizedBox(width: 8),
        _dot(isActive: true),
        const SizedBox(width: 8),
        _dot(isActive: false),
      ],
    );
  }

  Widget _dot({required bool isActive}) {
    return Container(
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF004ECC) : const Color(0xFFD6E4FF),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF0F4FF),
              foregroundColor: const Color(0xFF001D4D),
              elevation: 0,
              // minimumHeight: 60,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF004ECC),
              foregroundColor: Colors.white,
              // minimumHeight: 60,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Next',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
