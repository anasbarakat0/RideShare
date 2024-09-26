import 'package:flutter/material.dart';
import 'package:rideshare_/core/resources/colors.dart';

class Button extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.green),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;
  const WhiteButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        foregroundColor:
            WidgetStateProperty.all<Color>(const Color(0xFFB8B8B8)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;
  const BorderButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        side: BorderSide(width: 1, color: AppColors.green),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
        foregroundColor: AppColors.green,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
