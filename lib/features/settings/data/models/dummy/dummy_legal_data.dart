import '../legal_data_model.dart';

class DummyLegalData {
  static List<LegalDataModel> dummyPrivacyPolicy = List.generate(
    _privacySections.length,
    (index) => _privacySections[index],
  );

  static List<LegalDataModel> dummyTerms = List.generate(
    _termsSections.length,
    (index) => _termsSections[index],
  );

  // ─────────────────────────────
  // RAW DATA (source of truth)
  // ─────────────────────────────

  static final List<LegalDataModel> _privacySections = [
    LegalDataModel(
      title: "Effective Date: May 20, 2026",
    ),
    LegalDataModel(
      paragraphs: [
        'Moodly ("we," "us," or "our") is committed to protecting your privacy...',
      ],
    ),
    LegalDataModel(
      title: "1. Information We Collect:",
      bullets: [
        "Account Information",
        "Usage Data",
        "Optional Information",
      ],
    ),
    LegalDataModel(
      title: "2. How We Use Your Information:",
      bullets: [
        "Provide and improve the App",
        "Personalize experience",
        "Ensure security",
      ],
    ),
    LegalDataModel(
      title: "3. Data Protection:",
      paragraphs: [
        "We use encryption and secure storage to protect your data.",
      ],
    ),
  ];

  static final List<LegalDataModel> _termsSections = [
    LegalDataModel(
      title: "Effective Date: May 20, 2026",
    ),
    LegalDataModel(
      paragraphs: [
        "These Terms govern your use of the Moodly app.",
      ],
    ),
    LegalDataModel(
      title: "1. Eligibility:",
      paragraphs: [
        "You must be at least 13 years old to use the app.",
      ],
    ),
    LegalDataModel(
      title: "2. Acceptable Use:",
      bullets: [
        "No illegal activity",
        "No abuse or harm",
        "No interference with app",
      ],
    ),
    LegalDataModel(
      title: "3. User Content:",
      paragraphs: [
        "You are responsible for your content.",
      ],
    ),
  ];
}