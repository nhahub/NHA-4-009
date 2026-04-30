import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final VoidCallback onTap;

  const SecondaryButton({
    super.key,
    required this.child,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  double get _scale {
    if (_isPressed) return 0.88;
    if (_isHovered) return 1.12;
    return 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: widget.isActive
                  ? const Color(0xFFCCEFDF)
                  : (_isHovered
                        ? const Color(0xFFE4E4E4)
                        : const Color(0xFFF2F2F2)),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: _isHovered ? 0.13 : 0.06,
                  ),
                  blurRadius: _isHovered ? 14 : 6,
                  spreadRadius: _isHovered ? 1 : 0,
                  offset: Offset(0, _isHovered ? 4 : 2),
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
