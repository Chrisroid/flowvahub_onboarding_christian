import 'dart:math' as math;
import 'package:flowvahub/styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final tiles = <_ToolkitCardData>[
      _ToolkitCardData(
        title: "Designers Toolkit",
        subtitle: "1,200 creatives trust this stack",
        logoAssets: [
          "assets/logos/figma.png",
          "assets/logos/framer.png",
          "assets/logos/canva.png",
        ],
        angleDeg: -3,
      ),
      _ToolkitCardData(
        title: "Indie Hacker’s Essentials",
        subtitle: "Curated by Sam Ortega  building profitable products solo",
        logoAssets: [
          "assets/logos/vercel.png",
          "assets/logos/notion.png",
          "assets/logos/stripe.png",
        ],
        angleDeg: 2.2,
      ),
      _ToolkitCardData(
        title: "Remote Team Starter Pack",
        subtitle: "Curated by Kendra Holt  helping distributed teams thrive",
        logoAssets: [
          "assets/logos/slack.png",
          "assets/logos/miro.png",
          "assets/logos/loom.png",
        ],
        angleDeg: -1.7,
      ),
    ];

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                for (final t in tiles)
                  TiltCard(
                    angleDeg: t.angleDeg,
                    child: _ToolkitTile(
                      title: t.title,
                      logoAssets: t.logoAssets,
                      subtitle: t.subtitle,
                    ),
                  ),
                const SizedBox(height: 48),
                const Text(
                  "Work like the best",
                  textAlign: TextAlign.center,
                  style: flowvaHeadingTextStyle,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Discover proven tools from the people who master their craft",
                  textAlign: TextAlign.center,
                  style: flowvaBodyTextStyle,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TiltCard extends StatefulWidget {
  const TiltCard({
    super.key,
    required this.child,
    this.angleDeg = 0,
    this.margin = const EdgeInsets.symmetric(vertical: 10),
  });

  final Widget child;
  final double angleDeg; // positive = clockwise
  final EdgeInsets margin;

  @override
  State<TiltCard> createState() => _TiltCardState();
}

class _TiltCardState extends State<TiltCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final angle = widget.angleDeg * math.pi / 180;

    return AnimatedScale(
      duration: const Duration(milliseconds: 120),
      scale: _pressed ? 0.985 : 1,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          margin: widget.margin,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF), // #FFFFFF99
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFD7D7), // pink shadow
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTapDown: (_) => setState(() => _pressed = true),
                onTapCancel: () => setState(() => _pressed = false),
                onTap: () => setState(() => _pressed = false),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolkitTile extends StatelessWidget {
  const _ToolkitTile({
    required this.title,
    required this.logoAssets,
    required this.subtitle,
  });

  final String title;
  final List<String> logoAssets;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: flowvaTileTitleTextStyle, textAlign: TextAlign.center),
        const SizedBox(height: 12),

        // logos row
        Row(
          children: logoAssets.map((path) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(path, fit: BoxFit.contain),
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 12),
        Text(subtitle, style: flowvaTileSubtitleTextStyle, textAlign: TextAlign.center),
      ],
    );
  }
}

class _ToolkitCardData {
  final String title;
  final String subtitle;
  final List<String> logoAssets; // <- paths to your PNGs
  final double angleDeg;

  _ToolkitCardData({
    required this.title,
    required this.subtitle,
    required this.logoAssets,
    required this.angleDeg,
  });
}

