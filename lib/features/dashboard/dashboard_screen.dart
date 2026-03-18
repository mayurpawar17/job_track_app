import 'package:flutter/material.dart';
import 'package:job_track_app/core/constants/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandBlue = Color(0xFF004DCF);
    const Color textNavy = Color(0xFF0D1B3E);
    const Color bgLight = Color(0xFFF8F9FE);

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      // appBar: const CommonAppBar(
      //   title: "JobTrack",
      //   showBackButton: false, // Root screen
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Welcome Header ---
            const Text(
              "Hello, User",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: textNavy,
              ),
            ),
            const Text(
              "You have 4 active interviews this week.",
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            const SizedBox(height: 24),

            // --- Search Bar ---
            TextField(
              decoration: InputDecoration(
                hintText: "Search applications, companies, or r",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFD9E2FF)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFD9E2FF)),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- Stats Grid ---
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    "ACTIVE",
                    "24",
                    const Color(0xFFD9E2FF),
                    textNavy,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    "INTERVIEWS",
                    "08",
                    const Color(0xFF8FFFC8),
                    textNavy,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- Success Rate Bar ---
            _buildSuccessRateCard(),

            const SizedBox(height: 32),

            // --- Section Header ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Applications",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textNavy,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "VIEW ALL",
                    style: TextStyle(
                      color: brandBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- Recent Job Cards ---
            _buildDashboardJobCard(
              title: "Senior Product Designer",
              company: "Spotify",
              location: "Stockholm, SE",
              status: "OFFER",
              statusColor: const Color(0xFF8FFFC8),
              date: "Oct 12",
              details: "\$140k - \$180k",
              detailsIcon: Icons.payments_outlined,
            ),
            _buildDashboardJobCard(
              title: "Lead UI Engineer",
              company: "Airbnb",
              location: "Remote",
              status: "INTERVIEW",
              statusColor: const Color(0xFFD9E2FF),
              date: "Oct 10",
              details: "Round 3 tomorrow",
              detailsIcon: Icons.calendar_today,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: brandBlue,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color bg, Color text) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: text,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessRateCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SUCCESS RATE",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  letterSpacing: 1.1,
                ),
              ),
              Text(
                "12%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004DCF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: 0.12,
              minHeight: 8,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF004DCF)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardJobCard({
    required String title,
    required String company,
    required String location,
    required String status,
    required Color statusColor,
    required String date,
    required String details,
    required IconData detailsIcon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.apps),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "$company • $location",
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
              _buildSmallStatus(status, statusColor),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Icon(
                detailsIcon,
                size: 14,
                color: detailsIcon == Icons.calendar_today
                    ? Colors.green
                    : Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                details,
                style: TextStyle(
                  fontSize: 12,
                  color: detailsIcon == Icons.calendar_today
                      ? Colors.green
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallStatus(String text, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Color(0xFF004DCF),
        ),
      ),
    );
  }
}
