import 'package:flutter/material.dart';
import '../../core/theme.dart';

class TextContent extends StatelessWidget {
  final bool isCentered;

  const TextContent({required this.isCentered, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isCentered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '¡La Pizza ',
                style: AppTextStyles.headline.copyWith(
                  fontSize: isCentered ? 40 : 64,
                  height: 1.1,
                  shadows: const [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black54,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              TextSpan(
                text: 'perfecta',
                style: AppTextStyles.headline.copyWith(
                  fontSize: isCentered ? 40 : 64,
                  color: AppColors.accent,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  shadows: const [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.yellow,
                      offset: Offset(0, 0),
                    ),
                    Shadow(
                      blurRadius: 8,
                      color: Colors.black54,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              TextSpan(
                text: ' existe y está aquí!',
                style: AppTextStyles.headline.copyWith(
                  fontSize: isCentered ? 40 : 64,
                  height: 1.1,
                  shadows: const [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black54,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 20),
        Text(
          'Sabores irresistibles, ingredientes frescos y una masa que te va a conquistar. ¿Estás listo para un festín? Haz tu pedido y comencemos la fiesta.',
          style: AppTextStyles.subhead.copyWith(
            fontSize: isCentered ? 18 : 22,
            height: 1.5,
            color: Colors.white70,
          ),
          textAlign: isCentered ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }
}
