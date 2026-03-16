import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_textfield.dart';

class UpdateStatusBottomSheet extends StatefulWidget {
  final String jobTitle;
  final String company;

  const UpdateStatusBottomSheet({
    super.key,
    required this.jobTitle,
    required this.company,
  });

  @override
  State<UpdateStatusBottomSheet> createState() =>
      _UpdateStatusBottomSheetState();
}

class _UpdateStatusBottomSheetState extends State<UpdateStatusBottomSheet> {
  String selectedStatus = 'Interview';
  late TextEditingController _dateController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: "10/24/2023");
    _notesController = TextEditingController(
      text: "Received an email for first round",
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color brandBlue = Color(0xFF004DCF);
    const Color bgLightBlue = Color(0xFFF4F7FF);

    return Container(
      // Makes the sheet wrap content or expand as needed
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar for the bottom sheet
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    "Update Status",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D1B3E),
                    ),
                  ),
                  Text(
                    "${widget.jobTitle} at ${widget.company}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),

                  // Status Options
                  _statusItem(
                    Icons.work_outline,
                    "Applied",
                    "Application submitted",
                    const Color(0xFFE8EFFF),
                    const Color(0xFF004DCF),
                  ),
                  _statusItem(
                    Icons.chat_bubble_outline,
                    "Interview",
                    "Actively interviewing",
                    const Color(0xFFE8F5E9),
                    Colors.green,
                    isSelected: true,
                  ),
                  _statusItem(
                    Icons.card_giftcard_outlined,
                    "Offer",
                    "Received a formal offer",
                    const Color(0xFFE1F2ED),
                    const Color(0xFF006B44),
                  ),
                  _statusItem(
                    Icons.cancel_outlined,
                    "Rejected",
                    "Process has ended",
                    const Color(0xFFFFEBEE),
                    Colors.red,
                  ),

                  const SizedBox(height: 24),

                  // Secondary Info Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: bgLightBlue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        AppTextField(
                          label: "Status Date",
                          controller: _dateController,
                          prefixIcon: Icons.calendar_today,
                          fillColor: Colors.white,
                          borderColor: Colors.black12,
                        ),
                        AppTextField(
                          label: "Notes",
                          controller: _notesController,
                          maxLines: 3,
                          prefixIcon: Icons.notes,
                          fillColor: Colors.white,
                          borderColor: Colors.black12,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Actions
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 56,
                  //   child: ElevatedButton(
                  //     onPressed: () => Navigator.pop(context),
                  //     style: ElevatedButton.styleFrom(backgroundColor: brandBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  //     child: const Text("Update Status", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  //   ),
                  // ),
                  // TextButton(
                  //   onPressed: () => Navigator.pop(context),
                  //   child: const Text("Cancel", style: TextStyle(color: Color(0xFF0D1B3E))),
                  // ),
                  // const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brandBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Update Status",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Color(0xFF0D1B3E)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusItem(
    IconData icon,
    String title,
    String sub,
    Color bg,
    Color iconColor, {
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? Colors.green : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          sub,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: Colors.green)
            : null,
      ),
    );
  }
}
