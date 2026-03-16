import 'package:flutter/material.dart';
import 'package:job_track_app/core/constants/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? label; // Now optional and integrated
  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final Color fillColor;
  final Color borderColor;

  const AppTextField({
    super.key,
    this.label,
    this.initialValue,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.fillColor = const Color(0xFFF0F4FF),
    this.borderColor = const Color(0xFFD9E2FF),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Only show label if it's not null
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
            child: Text(
              label!.toUpperCase(),
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF53648E),
                letterSpacing: 0.5,
              ),
            ),
          ),

        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextFormField(
            initialValue: controller == null ? initialValue : null,
            controller: controller,
            maxLines: maxLines,
            readOnly: readOnly,
            onTap: onTap,
            keyboardType: keyboardType,
            style: const TextStyle(color: AppColors.secondary, fontSize: 16),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: AppColors.secondary, size: 20)
                  : null,
              filled: true,
              fillColor: fillColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
