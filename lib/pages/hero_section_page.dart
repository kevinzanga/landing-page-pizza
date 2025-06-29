// lib/pages/hero_section_page.dart

import 'package:flutter/material.dart';
import '../widgets/rotating_pizza.dart';
import '../widgets/text_content.dart';
import '../widgets/cta_button.dart';

class HeroSection extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey menuKey;

  const HeroSection({
    super.key,
    required this.scrollController,
    required this.menuKey,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Color(0xFF1A1A1A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Semantics(header: true, child: TextContent(isCentered: true)),
                const SizedBox(height: 32),
                CTAButton(scrollController: scrollController, menuKey: menuKey),
                const SizedBox(height: 32),
                ExcludeSemantics(child: RotatingPizzaImage(height: 320)),
                const SizedBox(height: 32),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Semantics(
                          header: true,
                          child: TextContent(isCentered: false),
                        ),
                        const SizedBox(height: 40),
                        CTAButton(
                          scrollController: scrollController,
                          menuKey: menuKey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 4,
                  child: ExcludeSemantics(
                    child: RotatingPizzaImage(height: 520),
                  ),
                ),
              ],
            ),
    );
  }
}
