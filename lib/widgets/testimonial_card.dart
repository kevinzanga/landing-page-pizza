import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../class/testimonial_model.dart';

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({required this.testimonial, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.format_quote,
              size: 36,
              // ignore: deprecated_member_use
              color: AppColors.accent.withOpacity(0.4),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            testimonial.comment,
            style: AppTextStyles.descard.copyWith(
              fontSize: 15,
              height: 1.4,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          const Divider(height: 1, thickness: 1, color: Colors.black12),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 34,
                backgroundImage: NetworkImage(testimonial.avatarUrl),
              ),
              const SizedBox(width: 14),
              Flexible(
                child: Text(
                  testimonial.name,
                  style: AppTextStyles.subhead.copyWith(
                    fontStyle: FontStyle.italic,
                    color: AppColors.textPrimary,
                    shadows: const [
                      Shadow(
                        color: Colors.black12,
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
