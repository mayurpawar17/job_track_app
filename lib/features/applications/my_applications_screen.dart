import 'package:flutter/material.dart';

import '../addJobApplication/presentation/screen/widget/add_job_application_screen.dart';
import 'job_details_screen.dart';

class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      // appBar: const CommonAppBar(
      //   title: "JobTrack",
      //   showBackButton: true, // As per image
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "My Applications",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D1B3E),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Manage your active pursuits and career milestones.",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              const SizedBox(height: 24),

              // Filter Chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip("All", isSelected: true),
                    _buildFilterChip("Applied"),
                    _buildFilterChip("Interview"),
                    _buildFilterChip("Offer"),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Application Cards
              _buildJobCard(
                title: "Senior Product Designer",
                company: "Stripe",
                location: "San Francisco, CA",
                date: "OCT 12, 2023",
                status: "INTERVIEW",
                statusColor: const Color(0xFF8FFFC8),
                logo: Icons.account_balance_wallet,
                // Placeholder for actual logo
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const JobDetailsScreen()),
                  );
                },
              ),

              _buildJobCard(
                title: "Senior Product Designer",
                company: "Stripe",
                location: "San Francisco, CA",
                date: "OCT 12, 2023",
                status: "INTERVIEW",
                statusColor: const Color(0xFF8FFFC8),
                logo: Icons.account_balance_wallet,
                // Placeholder for actual logo
                // onTap: () {},
              ),

              _buildJobCard(
                title: "Senior Product Designer",
                company: "Stripe",
                location: "San Francisco, CA",
                date: "OCT 12, 2023",
                status: "INTERVIEW",
                statusColor: const Color(0xFF8FFFC8),
                logo: Icons.account_balance_wallet,
                // Placeholder for actual logo
                // onTap: () {},
              ),
              _buildJobCard(
                title: "UI Engineering Lead",
                company: "Airbnb",
                location: "Remote",
                date: "OCT 10, 2023",
                status: "APPLIED",
                statusColor: const Color(0xFFD9E2FF),
                logo: Icons.home_work,
                // onTap: () {},
              ),
              _buildJobCard(
                title: "Founding Designer",
                company: "Linear",
                location: "London, UK",
                date: "OCT 05, 2023",
                status: "OFFER",
                statusColor: const Color(0xFF006B44),
                isDarkStatus: true,
                logo: Icons.layers,
                // onTap: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddJobApplication()),
          );
        },
        backgroundColor: const Color(0xFF004DCF),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      // bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFD9E2FF) : const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xFF004DCF) : const Color(0xFF0D1B3E),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildJobCard({
    required String title,
    required String company,
    required String location,
    required String date,
    required String status,
    required Color statusColor,
    bool isDarkStatus = false,
    required IconData logo,
    VoidCallback? onTap, // Added callback parameter
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      // Material widget is required for the InkWell ripple to show up
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16), // Match container radius
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F4FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(logo, color: const Color(0xFF0D1B3E)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0D1B3E),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "$company • $location",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isDarkStatus
                              ? Colors.white
                              : const Color(0xFF004DCF),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Color(0xFF004DCF)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF004DCF),
      unselectedItemColor: Colors.grey,
      currentIndex: 1,
      // Applications selected
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_customize_outlined),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Applications'),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_rounded),
          label: 'Analytics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
