import 'package:flutter/material.dart';
import 'package:job_track_app/features/addJobApplication/presentation/screen/widget/edit_job_application_screen.dart';

import '../../core/widgets/app_secondary_button.dart';
import '../../core/widgets/common_appbar.dart';
import '../addJobApplication/presentation/screen/widget/update_status_bottom_sheet.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color brandBlue = Color(0xFF004DCF);
    const Color bgBlue = Color(0xFFF0F4FF);
    const Color textPrimary = Color(0xFF0D1B3E);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(title: "JobTrack"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // --- Header Section ---
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7E6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.bakery_dining_outlined,
                        size: 40,
                        color: Colors.orange,
                      ), // Placeholder logo
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Senior Product\nDesigner",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Google Inc.",
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 16),
                    _buildStatusBadge("APPLIED"),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // --- Info Cards Section ---
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: bgBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _buildInfoRow(
                      Icons.location_on,
                      "LOCATION",
                      "Mountain View, CA (Hybrid)",
                      hasAction: true,
                    ),
                    const Divider(height: 32, color: Colors.white),
                    _buildInfoRow(
                      Icons.payments_outlined,
                      "SALARY RANGE",
                      "\$180k – \$240k / year",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildDateAndLinkCard(bgBlue),

              // --- Personal Notes Section ---
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.notes, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "Personal Notes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "EDIT NOTES",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              _buildNotesBox(),

              // --- Application Journey ---
              const SizedBox(height: 32),
              const Row(
                children: [
                  Icon(Icons.timeline, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Application Journey",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildTimelineStep(
                "Application Submitted",
                "October 24, 2023",
                isCompleted: true,
              ),
              _buildTimelineStep(
                "Interview Scheduled",
                "November 02, 2023 • 10:30 AM",
                isActive: true,
              ),
              _buildTimelineStep(
                "On-site Portfolio Review",
                "Pending completion of round 1",
                isLast: true,
                isPending: true,
              ),

              const SizedBox(height: 40),

              // --- Action Buttons ---
              Row(
                children: [
                  Expanded(
                    child: AppSecondaryButton(
                      label: "Edit Details",
                      icon: Icons.edit_outlined,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EditJobDetailsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppSecondaryButton(
                      label: "Delete",
                      icon: Icons.delete_outline,
                      backgroundColor: const Color(0xFFFFE0E0),
                      // Light red
                      textColor: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showUpdateStatus(context);
                  },
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const Text(
                    "Update Application Status",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brandBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: _buildBottomNav(), // Use your existing bottom nav
    );
  }

  // --- UI Helper Widgets ---

  Widget _buildStatusBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFD9E2FF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 16,
            color: Color(0xFF004DCF),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF004DCF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value, {
    bool hasAction = false,
  }) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF004DCF)),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.blueGrey,
                  letterSpacing: 1.1,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D1B3E),
                ),
              ),
            ],
          ),
        ),
        if (hasAction)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.public, color: Color(0xFF004DCF)),
          ),
      ],
    );
  }

  Widget _buildDateAndLinkCard(Color bg) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "APPLIED DATE",
            style: TextStyle(
              fontSize: 11,
              color: Colors.blueGrey,
              letterSpacing: 1.1,
            ),
          ),
          const Text(
            "Oct 24, 2023",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "JOB POSTING",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.open_in_new, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesBox() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(color: Color(0xFF004DCF), width: 4),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: const Text(
        "\"Initial screening went well with Sarah from HR. Emphasized experience with design systems and accessibility. Need to prepare portfolio deep-dive for the next round focusing on the JobTrack project specifically.\"",
        style: TextStyle(
          height: 1.5,
          color: Colors.black87,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildTimelineStep(
    String title,
    String subtitle, {
    bool isCompleted = false,
    bool isActive = false,
    bool isPending = false,
    bool isLast = false,
  }) {
    Color dotColor = isCompleted
        ? Colors.green
        : (isActive ? const Color(0xFF004DCF) : Colors.grey.shade300);
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                  border: isActive
                      ? Border.all(color: const Color(0xFFD9E2FF), width: 4)
                      : null,
                ),
                child: isCompleted
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : (isActive
                          ? const Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 3,
                              ),
                            )
                          : null),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: Colors.grey.shade200),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isPending ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryButton(
    IconData icon,
    String label,
    Color bg,
    Color text,
  ) {
    return SizedBox(
      height: 56,
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: text),
        label: Text(
          label,
          style: TextStyle(color: text, fontWeight: FontWeight.bold),
        ),
        style: TextButton.styleFrom(
          backgroundColor: bg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _showUpdateStatus(BuildContext context) {
    // Calculate 80% of screen height
    final double sheetHeight = MediaQuery.of(context).size.height * 0.8;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: sheetHeight, // Sets the height to 80%
          child: const UpdateStatusBottomSheet(
            jobTitle: "Senior Product Designer",
            company: "Google",
          ),
        ),
      ),
    );
  }
}
