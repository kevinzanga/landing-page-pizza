import 'package:flutter/material.dart';
import '../../core/theme.dart'; // O donde tengas definido AppColors, AppTextStyles
import '../class/feature_model.dart'; // Modelo

class FeatureCard extends StatelessWidget {
  final FeatureData data;

  const FeatureCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      // ignore: deprecated_member_use
      colors: [AppColors.accent.withOpacity(0.85), AppColors.accent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Container(
      width: 320,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: gradient,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: AppColors.accent.withOpacity(0.5),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(14),
            child: Icon(data.icon, size: 52, color: Colors.white),
          ),
          const SizedBox(height: 22),
          Text(
            data.title,
            style: AppTextStyles.titlecard.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),
          Text(
            data.description,
            style: AppTextStyles.descard.copyWith(
              fontSize: 16,
              height: 1.4,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
