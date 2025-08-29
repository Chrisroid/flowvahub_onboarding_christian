import 'package:flowvahub/styles.dart';
import 'package:flutter/material.dart';

class FlowvaButton extends StatefulWidget {
  const FlowvaButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  State<FlowvaButton> createState() => _FlowvaButtonState();
}

class _FlowvaButtonState extends State<FlowvaButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    const radius = 36.0;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          // main gradient (top a bit purple, bottom near black)
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF5F566A), // soft purple top
              Color(0xFF1C1B1F), // near black bottom
            ],
          ),
          // strong soft shadows under the pill
          boxShadow: [
            // far soft shadow
            BoxShadow(
              color: Colors.black.withOpacity(0.45),
              blurRadius: _pressed ? 32 : 60,
              spreadRadius: -6,
              offset: const Offset(0, 26),
            ),
            // wider faint halo
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: _pressed ? 24 : 40,
              spreadRadius: 8,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        child: Stack(
          children: [
            // faint top highlight to sell the “soft” look
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.white.withOpacity(0.08),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // label
            Center(
              child: Text(
                widget.label,
                style: flowvaButtonTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
