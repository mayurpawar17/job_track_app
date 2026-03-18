import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_textfield.dart';
import '../../../../../core/widgets/common_appbar.dart';

class EditJobDetailsScreen extends StatefulWidget {
  const EditJobDetailsScreen({super.key});

  @override
  State<EditJobDetailsScreen> createState() => _EditJobDetailsScreenState();
}

class _EditJobDetailsScreenState extends State<EditJobDetailsScreen> {
  // --- Controllers ---
  late TextEditingController _titleController;
  late TextEditingController _companyController;
  late TextEditingController _locationController;
  late TextEditingController _dateController;
  late TextEditingController _salaryController;
  late TextEditingController _linkController;
  late TextEditingController _notesController;

  bool isRemote = true;

  @override
  void initState() {
    super.initState();
    // Initializing with the data from your UI screenshot
    _titleController = TextEditingController(text: "Senior Product Designer");
    _companyController = TextEditingController(text: "Google Inc.");
    _locationController = TextEditingController(
      text: "Mountain View, CA (Hybrid)",
    );
    _dateController = TextEditingController(text: "Oct 24, 2023");
    _salaryController = TextEditingController(text: "\$180k - \$240k");
    _linkController = TextEditingController(
      text: "https://careers.google.com/jobs/res...",
    );
    _notesController = TextEditingController(
      text:
          "Initial screening went well with Sarah from HR. Emphasized user-centered research and system thinking. Next round is a portfolio walkthrough.",
    );
  }

  @override
  void dispose() {
    // Always dispose controllers when the widget is removed from the tree
    _titleController.dispose();
    _companyController.dispose();
    _locationController.dispose();
    _dateController.dispose();
    _salaryController.dispose();
    _linkController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color brandBlue = Color(0xFF004DCF);
    const Color bgLightBlue = Color(0xFFF4F7FF);
    const Color textNavy = Color(0xFF0D1B3E);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(title: "JobTrack"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "EDITOR MODE",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: brandBlue,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Edit Job Details",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: textNavy,
              ),
            ),
            const Text(
              "Refine the specifics for your role at Google Inc.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 32),

            AppTextField(label: "JOB TITLE", controller: _titleController),

            AppTextField(label: "COMPANY NAME", controller: _companyController),

            _buildLabel("STATUS"), // Kept for the custom dropdown
            _buildDropdownField("Applied"),

            const SizedBox(height: 24),

            // --- Secondary Info Container ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: bgLightBlue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    label: "LOCATION",
                    controller: _locationController,
                    prefixIcon: Icons.location_on,
                    fillColor: Colors.white,
                    borderColor: Colors.black12,
                  ),

                  _buildLabel("JOB TYPE"),
                  _buildSegmentedControl(),
                  const SizedBox(height: 20),

                  AppTextField(
                    label: "APPLICATION DATE",
                    controller: _dateController,
                    prefixIcon: Icons.calendar_today,
                    fillColor: Colors.white,
                    borderColor: Colors.black12,
                  ),

                  AppTextField(
                    label: "SALARY RANGE",
                    controller: _salaryController,
                    prefixIcon: Icons.payments_outlined,
                    fillColor: Colors.white,
                    borderColor: Colors.black12,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            AppTextField(
              label: "JOB LINK",
              controller: _linkController,
              prefixIcon: Icons.link,
            ),

            AppTextField(
              label: "NOTES",
              controller: _notesController,
              maxLines: 4,
            ),

            const SizedBox(height: 40),

            _buildButton("Save Changes", brandBlue, Colors.white, () {
              // Access data via _titleController.text etc.
            }),
            const SizedBox(height: 12),
            _buildButton(
              "Cancel",
              const Color(0xFFD9E2FF),
              textNavy,
              () => Navigator.pop(context),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // Helper for the specific non-TextField components
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Color(0xFF53648E),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD9E2FF)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: [
            value,
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) {},
        ),
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Row(
      children: [
        Expanded(child: _buildSegmentItem("On-site", !isRemote)),
        const SizedBox(width: 12),
        Expanded(child: _buildSegmentItem("Remote", isRemote)),
      ],
    );
  }

  Widget _buildSegmentItem(String label, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => isRemote = (label == "Remote")),
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF004DCF) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? null : Border.all(color: Colors.black12),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    String label,
    Color bg,
    Color text,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: text,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
