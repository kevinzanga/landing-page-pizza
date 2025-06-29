import 'package:flutter/material.dart';

class RotatingPizzaImage extends StatefulWidget {
  final double height;
  const RotatingPizzaImage({required this.height, super.key});

  @override
  State<RotatingPizzaImage> createState() => _RotatingPizzaImageState();
}

class _RotatingPizzaImageState extends State<RotatingPizzaImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: SizedBox(
        width: widget.height,
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.height * 0.83,
              height: widget.height * 0.83,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.yellow.shade700.withOpacity(0.4),
                    blurRadius: 14,
                    spreadRadius: 1.2,
                    offset: const Offset(0, 0),
                  ),
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/hero_section/pizza.png',
              height: widget.height,
              fit: BoxFit.contain,
              semanticLabel: 'Imagen rotativa de una pizza',
            ),
          ],
        ),
      ),
    );
  }
}
