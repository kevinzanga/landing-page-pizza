import 'package:flutter/material.dart';
import '../core/theme.dart';

class Header extends StatefulWidget {
  final void Function(String)? onItemSelected;

  const Header({super.key, this.onItemSelected});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  bool menuOpen = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<String> navItems = [
    'Inicio',
    'Menú',
    'Promociones',
    'Beneficios',
    'Testimonios',
    'Contacto',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void toggleMenu() {
    setState(() {
      menuOpen = !menuOpen;
      if (menuOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void onNavItemClicked(String title) {
    // Aquí puedes agregar la lógica para navegar o hacer scroll
    // y luego cerrar el menú si está abierto (en móvil)
    widget.onItemSelected?.call(title);
    if (menuOpen) toggleMenu();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.transparent, // fondo transparente
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo + Icono pizza
              Row(
                children: [
                  const Icon(
                    Icons.local_pizza,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 32,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'PizzArt',
                    style: AppTextStyles.logo.copyWith(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              if (!isMobile)
                Row(
                  children: navItems
                      .map(
                        (title) => NavItem(
                          title: title,
                          onTap: () => onNavItemClicked(title),
                        ),
                      )
                      .toList(),
                )
              else
                InkWell(
                  onTap: toggleMenu,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      menuOpen ? Icons.close : Icons.menu,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 30,
                    ),
                  ),
                ),
            ],
          ),
        ),

        // Menú móvil
        if (isMobile)
          SizeTransition(
            sizeFactor: _fadeAnimation,
            axisAlignment: -1.0,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                width: double.infinity,
                color: const Color.fromARGB(
                  255,
                  253,
                  252,
                  251,
                  // ignore: deprecated_member_use
                ).withOpacity(0.95),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: navItems
                      .map(
                        (title) => InkWell(
                          onTap: () => onNavItemClicked(title),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              title,
                              style: AppTextStyles.navItem.copyWith(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavItem({super.key, required this.title, required this.onTap});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: _isHover
                // ignore: deprecated_member_use
                ? const Color.fromARGB(255, 245, 244, 241).withOpacity(0.3)
                : Colors.transparent,
          ),
          child: Text(
            widget.title,
            style: AppTextStyles.navItem.copyWith(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: _isHover ? FontWeight.w700 : FontWeight.w700,
              letterSpacing: 0.5,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
