import 'package:flutter/material.dart';
import 'package:landing_page_pizza/pages/menu_page.dart';
import 'package:landing_page_pizza/pages/promo_page.dart';

import '../widgets/header.dart';
import '../pages/hero_section_page.dart';
import '../pages/info_cards_page.dart';
import '../pages/testimonials_page.dart';
import '../pages/contact_page.dart';
import '../widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  final _heroKey = GlobalKey();
  final _menuKey = GlobalKey();
  final _promoKey = GlobalKey();
  final _infoKey = GlobalKey();
  final _testimonialsKey = GlobalKey();
  final _contactKey = GlobalKey();

  void scrollToSection(String section) {
    final contextMap = {
      'Inicio': _heroKey,
      'Menú': _menuKey,
      'Promociones': _promoKey,
      'Beneficios': _infoKey,
      'Testimonios': _testimonialsKey,
      'Contacto': _contactKey,
    };

    final key = contextMap[section];
    if (key != null && key.currentContext != null) {
      final renderBox = key.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero, ancestor: null).dy;

      final currentScroll = _scrollController.offset;

      if ((currentScroll - position).abs() > 100) {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Mostrar la ruleta al terminar el primer frame
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80), // altura del header
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(
                    key: _heroKey,
                    scrollController: _scrollController,
                    menuKey: _menuKey,
                  ),
                  PromoPage(key: _promoKey),
                  MenuPage(key: _menuKey),
                  InfoCardsPage(key: _infoKey),
                  TestimonialsPage(key: _testimonialsKey),
                  ContactPage(key: _contactKey),
                  const Footer(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Header(onItemSelected: scrollToSection),
          ),
        ],
      ),
    );
  }
}
