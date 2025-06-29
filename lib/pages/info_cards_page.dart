import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../data/features_data.dart'; // Lista de features
import '../widgets/feature_card.dart'; // Widget FeatureCard

class InfoCardsPage extends StatelessWidget {
  const InfoCardsPage({super.key});

  Widget _buildStyledTitle() {
    return Column(
      children: [
        Text(
          '¿Por qué elegirnos?',
          textAlign: TextAlign.center,
          style: AppTextStyles.textcard.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.accent,
            shadows: const [
              Shadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 160,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFAFAFA), // muy claro arriba
            Color(0xFFF2F2F2), // gris cálido abajo
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildStyledTitle(),
          const SizedBox(height: 36),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: featuresList
                .map((feature) => FeatureCard(data: feature))
                .toList(),
          ),
        ],
      ),
    );
  }
}
