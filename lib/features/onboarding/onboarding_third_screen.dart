import 'package:flutter/material.dart';

import '../../core/constants/app_gap.dart';

class OnboardingThirdScreen extends StatelessWidget {
  const OnboardingThirdScreen({super.key});

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
                  const SizedBox(height: 20),
                  _buildIllustrationStack(),
                  const Spacer(),
                  _buildTextSection(),
                  AppGap.s32,

                  // const SizedBox(height: 40),
                  // _buildPageIndicator(),
                  // const SizedBox(height: 40),
                  // _buildGetStartedButton(),
                  // const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          const Text(
            'JobTrack',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF001D4D),
            ),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
    );
  }

  Widget _buildIllustrationStack() {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Follow up email card (Top)
          Positioned(top: 20, left: 0, right: 0, child: _reminderCard()),
          // Interview Notes Card (Middle)
          Positioned(top: 110, child: _notesCard()),
          // Floating Label (Bottom)
          Positioned(
            bottom: 40,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFD6E4FF).withOpacity(0.7),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'FOLLOW-UP PENDING',
                style: TextStyle(
                  color: Color(0xFF003EB3),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _reminderCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFF9FFFCB),
                child: Icon(Icons.notifications, color: Color(0xFF008040)),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Follow up email',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Tomorrow at 10:00 AM',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const LinearProgressIndicator(
              value: 0.7,
              minHeight: 8,
              backgroundColor: Color(0xFFE8EFFF),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF005221)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _notesCard() {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Interview Notes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001D4D),
                ),
              ),
              Icon(Icons.edit_note, color: Color(0xFF004ECC)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Icon(Icons.link, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                'portfolio-presentation.pdf',
                style: TextStyle(
                  color: Color(0xFF004ECC),
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '"Mention the growth metrics from the Q3 project during the technical round."',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueGrey[700],
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Column(
      children: [
        const Text(
          'Never miss follow-ups',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Color(0xFF001D4D),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Add notes, links, and reminders for\nevery job.',
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
        _dot(isActive: false),
        const SizedBox(width: 8),
        _dot(isActive: false),
        const SizedBox(width: 8),
        _dot(isActive: true),
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

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF004ECC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
