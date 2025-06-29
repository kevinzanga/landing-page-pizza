import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../data/pizza_data.dart';
import '../widgets/category_chip.dart';
import '../widgets/pizza_card.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  String selectedCategory = 'Todas';
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildCardWrapper(Widget child, int index) {
    final animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.1 * index, 0.1 * index + 0.5, curve: Curves.easeIn),
      ),
    );

    return FadeTransition(
      opacity: animation,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(borderRadius: BorderRadius.circular(20), child: child),
      ),
    );
  }

  Widget buildStyledTitle() {
    return Column(
      children: [
        Text(
          'Nuestro Menú 🍕',
          style: AppTextStyles.body.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
            shadows: const [
              Shadow(
                color: Colors.black54,
                blurRadius: 6,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 200,
          height: 2.5,
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
    final filteredPizzas = selectedCategory == 'Todas'
        ? pizzas
        : pizzas.where((p) => p.category == selectedCategory).toList();

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 26, 26, 26),
            Color.fromARGB(255, 19, 19, 19),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildStyledTitle(),
          const SizedBox(height: 28),
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryChip(
                  label: category,
                  selected: category == selectedCategory,
                  onTap: () => setState(() => selectedCategory = category),
                );
              },
            ),
          ),
          const SizedBox(height: 36),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return Column(
                  children: List.generate(
                    filteredPizzas.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: buildCardWrapper(
                        PizzaCard(
                          pizza: filteredPizzas[index],
                          isMobile: true,
                          width: screenWidth * 0.9,
                          onAddToCart: () {},
                        ),
                        index,
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
                    filteredPizzas.length,
                    (index) => buildCardWrapper(
                      PizzaCard(
                        pizza: filteredPizzas[index],
                        isMobile: false,
                        width: 320,
                        onAddToCart: () {},
                      ),
                      index,
                    ),
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
