import 'package:flowvahub/styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                subscriptionTile(
                  "Framer",
                  "\$12",
                  "Billed in 4 days",
                  "assets/backgrounds/figma_big_bg.png",
                  logoAsset: "assets/logos/framer.png",
                  actions: Row(
                    children: [
                      actionButton("View", Color(0xFF9013FE), Color(0XFFFBDFEE)),
                      const SizedBox(width: 8),
                      actionButton("Remind", Color(0XFF000000), Color(0xFFF3E2E9)),
                      const SizedBox(width: 8),
                      actionButton("Cancel", Color(0XFF800000), Color(0xFFFFE0E0)),
                    ],
                  ),
                ),
                subscriptionTile(
                  "Figma",
                  "\$12",
                  "Billed in 9 days",
                  logoAsset: "assets/logos/figma.png",
                  "assets/backgrounds/figma_bg.png",
                ),
                subscriptionTile(
                  "Notion",
                  "\$12",
                  "Billed in 16 days",
                  logoAsset: "assets/logos/notion.png",
                  "assets/backgrounds/figma_bg.png",
                ),
                subscriptionTile(
                  "ChatGPT",
                  "\$12",
                  "Billed in 24 days",
                  logoAsset: "assets/logos/chatgpt.png",
                  "assets/backgrounds/figma_bg.png",
                ),
                const SizedBox(height: 50),
                const Text(
                  "Keep track of every subscription",
                  textAlign: TextAlign.center,
                  style: flowvaHeadingTextStyle
                ),
                const SizedBox(height: 8),
                const Text(
                  "Stay on top of what you pay for.",
                  textAlign: TextAlign.center,
                  style: flowvaBodyTextStyle
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget subscriptionTile(
      String title,
      String price,
      String billing,
      String pngAsset, {
        required String logoAsset,
        Widget? actions,
      }) {
    final hasActions = actions != null;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      constraints: BoxConstraints(minHeight: hasActions ? 150 : 104),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(pngAsset),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, hasActions ? 16 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // left side: logo + title
                Row(
                  children: [
                    Image.asset(
                      logoAsset,
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(title, style: flowvaSubscriptionTitleTextStyle),
                  ],
                ),

                // right side: price + billing
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(price,
                        style: flowvaSubscriptionPriceTextStyle,
                        textAlign: TextAlign.right),
                    Text(billing,
                        style: flowvaSubscriptionBillingTextStyle,
                        textAlign: TextAlign.right),
                  ],
                ),
              ],
            ),
            if (hasActions) ...[
              const SizedBox(height: 24),
              actions,
            ],
          ],
        ),
      ),
    );
  }



  Widget actionButton(String text, Color textColor, Color bgColor) {
    return Expanded(
      child: SizedBox(
        height: 44, // matches the design; prevents row from growing unexpectedly
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 16 / 14,
                letterSpacing: 0.0,
              ).copyWith(color: textColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
