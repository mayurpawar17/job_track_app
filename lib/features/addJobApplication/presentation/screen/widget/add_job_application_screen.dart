import 'package:flutter/material.dart';
import 'package:job_track_app/core/widgets/common_appbar.dart';
import 'package:job_track_app/features/applications/my_applications_screen.dart';

import '../../../../../core/constants/app_colors.dart';

class AddJobApplication extends StatefulWidget {
  const AddJobApplication({super.key});

  @override
  State<AddJobApplication> createState() => _AddJobApplicationState();
}

class _AddJobApplicationState extends State<AddJobApplication> {
  String selectedStatus = 'Applied';

  @override
  Widget build(BuildContext context) {
    const Color inputFillColor = Color(0xFFF0F4FF);
    const Color labelColor = Color(0xFF333333);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(title: "JobTrack"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add New Application",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Curate your next career move with precision.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),

            _buildLabel("JOB TITLE"),
            _buildTextField("e.g. Senior Product Designer"),

            _buildLabel("COMPANY NAME"),
            _buildTextField("e.g. Linear"),

            _buildLabel("LOCATION"),
            _buildTextField("London, UK", icon: Icons.location_on),

            _buildLabel("JOB TYPE"),
            _buildDropdown(),

            _buildLabel("APP DATE"),
            _buildTextField("mm/dd/yyyy", icon: Icons.calendar_today_outlined),

            _buildLabel("JOB LINK"),
            _buildTextField(
              "https://careers.company.com/...",
              icon: Icons.link,
            ),

            _buildLabel("SALARY RANGE"),
            _buildTextField("e.g. £80k - £100k", icon: Icons.payments_outlined),

            const SizedBox(height: 16),
            _buildStatusSection(),

            const SizedBox(height: 24),
            _buildLabel("NOTES & RESEARCH"),
            _buildTextField(
              "Include key talking points, company mission, or referral details...",
              maxLines: 5,
            ),

            const SizedBox(height: 40),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MyApplicationsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Save Job Entry",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Discard Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: inputFillColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Discard Draft",
                  style: TextStyle(fontSize: 16, color: AppColors.secondary),
                ),
              ),
            ),
            const SizedBox(height: 80), // Space for FAB
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
          color: Color(0xFF333333),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {IconData? icon, int maxLines = 1}) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: icon != null
            ? Icon(icon, color: Colors.grey, size: 20)
            : null,
        filled: true,
        fillColor: const Color(0xFFF0F4FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: "Remote",
          isExpanded: true,
          items: [
            "Remote",
            "On-site",
            "Hybrid",
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) {},
        ),
      ),
    );
  }

  Widget _buildStatusSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CURRENT STATUS",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: ['Applied', 'Interview', 'Offer', 'Rejected'].map((
              status,
            ) {
              final isSelected = selectedStatus == status;
              return GestureDetector(
                onTap: () => setState(() => selectedStatus = status),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFD9E2FF)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isSelected
                          ? Colors.transparent
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: isSelected ? AppColors.secondary : Colors.black,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
