import 'package:flowvahub/onboarding/onboarding_page_1.dart';
import 'package:flowvahub/onboarding/onboarding_page_2.dart';
import 'package:flowvahub/widgets/flowva_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlowvaApp());
}

class FlowvaApp extends StatelessWidget {
  const FlowvaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flowva',
      theme: ThemeData(
        fontFamily: 'SFPro',
        scaffoldBackgroundColor: const Color(0xFFFDF6F6),
      ),
      home: const OnboardingWrapper(),
    );
  }
}

class OnboardingWrapper extends StatefulWidget {
  const OnboardingWrapper({super.key});

  @override
  State<OnboardingWrapper> createState() => _OnboardingWrapperState();
}

class _OnboardingWrapperState extends State<OnboardingWrapper> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        children: const [
          OnboardingPage1(),
          OnboardingPage2(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // page indicator (as we added earlier)...
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                final isActive = currentIndex == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: isActive ? 20 : 8,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.black : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),

            // the pill button
            SizedBox(
              width: double.infinity,
              child: FlowvaButton(
                label: "Get started",
                onPressed: () {
                  if (currentIndex == 0) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // TODO: navigate to your app's next screen
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
