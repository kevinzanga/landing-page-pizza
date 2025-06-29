import 'package:flutter/material.dart';
import '../core/theme.dart';

import '../data/promo_data.dart';
import '../widgets/promo_card.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final int animationDuration = 500; // Duración en ms por tarjeta

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration * promoPizzas.length),
    );
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildStyledTitle() {
    return Column(
      children: [
        Text(
          'Promociones Especiales 🍕🔥',
          style: AppTextStyles.body.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white, // mejor en blanco sobre negro
            shadows: const [
              Shadow(
                blurRadius: 3,
                color: Colors.black54,
                offset: Offset(1, 1),
              ),
            ],
          ),
          textAlign: TextAlign.center,
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

  Widget _buildAnimatedPromoCard(int index, bool isMobile, double width) {
    final start =
        (index * animationDuration) / (_controller.duration!.inMilliseconds);
    final end =
        start + animationDuration / _controller.duration!.inMilliseconds;

    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeIn),
      ),
    );

    return FadeTransition(
      opacity: animation,
      child: PromoCard(
        pizza: promoPizzas[index],
        isMobile: isMobile,
        width: width,
        onPressed: () {
          // Acción para aprovechar promo
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      color: const Color.fromARGB(255, 26, 26, 26), // Fondo negro sólido
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildStyledTitle(),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return Column(
                  children: List.generate(
                    promoPizzas.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _buildAnimatedPromoCard(
                        index,
                        true,
                        screenWidth * 0.9,
                      ),
                    ),
                  ),
                );
              } else {
                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                    promoPizzas.length,
                    (index) => _buildAnimatedPromoCard(index, false, 320),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
