import 'package:flutter/material.dart';
import 'package:portfolio/themes/app_colors.dart';
import 'package:portfolio/themes/app_text_styles.dart';

class MessageStatusWidget extends StatelessWidget {
  const MessageStatusWidget({
    super.key,
    this.isSuccess,
  });

  final bool? isSuccess;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isSuccess == null
          ? null
          : Container(
              key: ValueKey(isSuccess),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: _getStatusColor(
                  isSuccess!,
                ).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _getStatusColor(
                    isSuccess!,
                  ).withValues(alpha: 0.3),
                  width: 0.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getStatusIcon(isSuccess!),
                    color: _getStatusColor(isSuccess!),
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _getStatusMessage(isSuccess!),
                    style: AppTextStyles.regular14.copyWith(
                      color: _getStatusColor(isSuccess!),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Color _getStatusColor(bool isSuccess) {
    if (isSuccess) {
      return AppColors.primary;
    } else {
      return AppColors.red;
    }
  }

  IconData _getStatusIcon(bool isSuccess) {
    if (isSuccess) {
      return Icons.check_circle_outline;
    } else {
      return Icons.error_outline;
    }
  }

  String _getStatusMessage(bool isSuccess) {
    if (isSuccess) {
      return "Message sent successfully! I'll get back to you soon.";
    } else {
      return "Oops! Something went wrong. Please try again or email me directly.";
    }
  }
}
