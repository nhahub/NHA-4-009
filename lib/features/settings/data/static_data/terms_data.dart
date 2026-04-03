import 'package:moodly/features/settings/data/models/terms_section.dart';

final List<TermsSection> termsData = [
  TermsSection(
    title: "1. Who Can Use the App:",
    paragraphs: [
      "You must be at least 13 years old to use the App. By using the App, you confirm that you meet this requirement.",
    ],
  ),
  TermsSection(
    title: "2. Acceptable Use:",
    paragraphs: [
      "You agree to use the App only for lawful purposes and in accordance with these Terms.",
    ],
    bullets: [
      "Violate any applicable laws or regulations",
      "Infringe upon the rights of others",
      "Transmit harmful, abusive, or offensive content",
      "Disrupt or interfere with the operation of the App",
      "Impersonate any person or entity",
    ],
  ),
  TermsSection(
    title: "3. User Content:",
    paragraphs: [
      "You are responsible for any content you post, upload, or share through the App.",
      "You retain ownership of your content but grant the app a license to use it.",
    ],
  ),
  TermsSection(
    title: "4. Mental Health Disclaimer:",
    paragraphs: [
      "The App supports mental wellness but does not provide medical advice.",
      "Please consult a professional if needed.",
    ],
  ),
  TermsSection(
    title: "5. Privacy:",
    paragraphs: [
      "Please review our Privacy Policy to understand how we use your data.",
    ],
  ),
  TermsSection(
    title: "6. Termination:",
    paragraphs: [
      "We may suspend or terminate your access if you violate these terms.",
    ],
  ),
  TermsSection(
    title: "7. Changes to Terms:",
    paragraphs: ["We may update these terms from time to time."],
  ),
  TermsSection(
    title: "8. Contact Us:",
    paragraphs: ["If you have questions, contact us at:", "your@email.com"],
  ),
];
