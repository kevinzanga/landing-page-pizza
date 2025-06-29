import 'package:flutter/material.dart';
import '../core/theme.dart';

class CategoryChip extends StatefulWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool _isHovered = false;
  bool _isFocused = false;

  void _onFocusChange(bool focused) {
    setState(() => _isFocused = focused);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.selected
        ? AppColors.accent
        : (_isHovered || _isFocused)
        ? Colors.grey.shade300
        : Colors.grey.shade200;

    final textColor = widget.selected ? Colors.white : Colors.grey[700];

    return FocusableActionDetector(
      onShowFocusHighlight: _onFocusChange,
      mouseCursor: SystemMouseCursors.click,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: widget.selected
                ? [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: AppColors.accent.withOpacity(0.4),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: GestureDetector(
            onTap: widget.onTap,
            child: Text(
              widget.label,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
