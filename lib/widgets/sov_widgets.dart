import 'package:flutter/material.dart';

class AppColors {
  static const Color orange        = Color(0xFFFF6B2B);
  static const Color green         = Color(0xFF00A86B);
  static const Color bg            = Color(0xFFF5F5F7);
  static const Color dark          = Color(0xFF0D0D1A);
  static const Color hint          = Color(0xFF9A9AB0);
  static const Color cardBg        = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF6B6B80);
  static const Color border        = Color(0xFFE4E4EC);
}

class SOVLogo extends StatelessWidget {
  final double size;
  const SOVLogo({super.key, this.size = 72});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 2.8,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(size * 0.22),
        boxShadow: [
          BoxShadow(
              color: AppColors.orange.withOpacity(0.28),
              blurRadius: 28,
              offset: const Offset(0, 12)),
          BoxShadow(
              color: Colors.black.withOpacity(0.18),
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _letter('S', AppColors.orange, size),
          _letter('O', Colors.white,     size),
          _letter('V', AppColors.green,  size),
        ],
      ),
    );
  }

  Widget _letter(String char, Color color, double s) => Padding(
    padding: EdgeInsets.symmetric(horizontal: s * 0.04),
    child: Text(char,
        style: TextStyle(
            fontSize: s * 0.52,
            fontWeight: FontWeight.w900,
            color: color,
            letterSpacing: -1,
            height: 1)),
  );
}

class SOVTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? errorText;

  const SOVTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: errorText != null
                    ? Colors.red.shade300
                    : AppColors.border,
                width: 1.2),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 14,
                  offset: const Offset(0, 4))
            ],
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: const TextStyle(
                fontSize: 15,
                color: AppColors.dark,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: AppColors.hint, fontSize: 14),
              prefixIcon: Icon(icon, color: AppColors.hint, size: 20),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: AppColors.cardBg,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 17),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Text(errorText!,
                style: TextStyle(color: Colors.red.shade600, fontSize: 12)),
          ),
      ],
    );
  }
}

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final List<Color> colors;

  const GradientButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.colors = const [Color(0xFFFF6B2B), Color(0xFFFF9500)],
  });

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null || isLoading;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: disabled
                ? [Colors.grey.shade400, Colors.grey.shade300]
                : colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: disabled ? [] : [
            BoxShadow(
                color: colors.first.withOpacity(0.42),
                blurRadius: 20,
                offset: const Offset(0, 7))
          ],
        ),
        child: ElevatedButton(
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
          ),
          child: isLoading
              ? const SizedBox(
              width: 22, height: 22,
              child: CircularProgressIndicator(
                  color: Colors.white, strokeWidth: 2.5))
              : Text(label,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.3)),
        ),
      ),
    );
  }
}

Widget buildErrorBox(String msg) => Container(
  width: double.infinity,
  padding: const EdgeInsets.all(13),
  margin: const EdgeInsets.only(bottom: 16),
  decoration: BoxDecoration(
      color: Colors.red.shade50,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.red.shade200)),
  child: Row(children: [
    Icon(Icons.error_outline, color: Colors.red.shade600, size: 18),
    const SizedBox(width: 8),
    Expanded(
        child: Text(msg,
            style: TextStyle(color: Colors.red.shade700, fontSize: 13))),
  ]),
);
