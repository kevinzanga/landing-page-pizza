import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../widgets/testimonial_card.dart';
import '../data/testimonials_data.dart';

class TestimonialsPage extends StatelessWidget {
  const TestimonialsPage({super.key});

  Widget _buildStyledTitle() {
    return Column(
      children: [
        Text(
          'Lo que dicen nuestros clientes...',
          textAlign: TextAlign.center,
          style: AppTextStyles.textcard.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.accent,
            shadows: const [
              Shadow(
                blurRadius: 4,
                color: Colors.black26,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: 200,
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
          colors: [Color(0xFFFAFAFA), Color(0xFFF2F2F2)],
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
            children: testimonials
                .map((t) => TestimonialCard(testimonial: t))
                .toList(),
          ),
        ],
      ),
    );
  }
}
