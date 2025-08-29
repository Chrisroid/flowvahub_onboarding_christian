# Flowva Onboarding Screens – Submission

## 📱 Overview
This project implements **2 onboarding pages** for the Flowva app, following the provided Figma designs.  
The goal was to translate the design precisely into Flutter, ensuring clarity, responsiveness, and a smooth user flow.

- **Page 1:** Subscription overview  
  - Subscription tiles with logos, prices, and billing info  
  - Custom PNG backgrounds  
  - Action buttons styled per design (View / Remind / Cancel)  
  - Headline and subtext at the bottom

- **Page 2:** Toolkits  
  - Tilted cards with shadows (#FFD7D7) and semi-transparent white backgrounds  
  - Toolkit logos shown in circular badges  
  - Title + subtitle styling from Figma  
  - Page ends with a heading and description

Both pages are mobile-first but designed to scale on different screen sizes.

---

## 🛠️ Tech Stack
- **Flutter (Dart)** – my strongest framework  
- **Manrope font** (imported as custom font via `pubspec.yaml`)  
- **Assets** – PNG logos and backgrounds  
- **flutter_svg** (optional, if using SVGs)  
- **Material 3 Widgets** – with custom theming for Flowva’s brand feel

---

## 🎨 Design Implementation
- All **text styles** (button labels, titles, subtitles, body text) follow exact Figma specs:
  - Font: *Manrope*  
  - Font weights: Regular (400), Medium (500), SemiBold (600), Bold (700)  
  - Line height, letter spacing, and colors match the design tokens.  
- **Buttons**: Gradient pill button with shadows, matching the provided sample.  
- **Cards**: Rounded corners (`22–24px`), shadows (#FFD7D7 for tilt cards), and PNG backgrounds for subscription tiles.  
- **Logos**: Each subscription tile and toolkit card includes logos placed inside circular containers.

---

## ⚡ Challenges
- **Overflow with action buttons** – solved by removing fixed heights and letting cards auto-size, while keeping predictable min-heights.  
- **Tilt card shadows** – fine-tuned blur, spread, and offset to replicate the Figma pink shadow.  
- **Exact text styles** – adjusted `height` for line-height ratios and negative letter-spacing.  
- **Consistency** – extracted all text styles into a central `styles.dart` for reuse.

---

