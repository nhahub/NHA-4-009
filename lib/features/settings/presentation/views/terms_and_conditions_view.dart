import 'package:flutter/material.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class TermsOfServiceView extends StatelessWidget {
  const TermsOfServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: BackButtonAppbar(title: "Terms of Service"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // Date
              _TitleText("Effective Date: December 20, 2024"),

              SizedBox(height: 8),

              _BodyText(
                'These Terms of Service ("Terms") govern your access to and use of the Modily mobile application (the "App"). By downloading, accessing, or using the App, you agree to be bound by these Terms.',
              ),

              SizedBox(height: 20),

              _SectionTitle("1. Who Can Use the App:"),

              SizedBox(height: 10),

              _BodyText(
                "You must be at least 13 years old to use the App. By using the App, you confirm that you meet this requirement.",
              ),

              SizedBox(height: 20),

              _SectionTitle("2. Acceptable Use:"),

              SizedBox(height: 10),

              _BodyText(
                "You agree to use the App only for lawful purposes and in accordance with these Terms. You agree not to:",
              ),

              SizedBox(height: 10),

              _BulletText("Violate any applicable laws or regulations"),

              _BulletText("Infringe upon the rights of others"),

              _BulletText("Transmit harmful, abusive, or offensive content"),

              _BulletText("Disrupt or interfere with the operation of the App"),

              _BulletText("Impersonate any person or entity"),

              SizedBox(height: 20),

              _SectionTitle("3. User Content:"),

              SizedBox(height: 10),

              _BodyText(
                'You are responsible for any content you post, upload, or share through the App ("User Content").',
              ),

              SizedBox(height: 10),

              _BodyText(
                "You retain ownership of your User Content. However, by submitting content, you grant Modily a non-exclusive, worldwide, royalty-free license to use, display, and improve the App experience.",
              ),

              SizedBox(height: 20),

              _SectionTitle("4. Mental Health Disclaimer:"),

              SizedBox(height: 10),

              _BodyText(
                "The App is designed to support mood improvement and mental wellness. However, Modily is not a medical service and does not provide professional medical or psychological advice.",
              ),

              SizedBox(height: 10),

              _BodyText(
                "If you are experiencing serious mental health issues, please consult a qualified healthcare professional.",
              ),

              SizedBox(height: 20),

              _SectionTitle("5. Privacy:"),

              SizedBox(height: 10),

              _BodyText(
                "Your privacy is important to us. Please review our Privacy Policy to understand how we collect and use your data.",
              ),

              SizedBox(height: 20),

              _SectionTitle("6. Termination:"),

              SizedBox(height: 10),

              _BodyText(
                "We reserve the right to suspend or terminate your access to the App at any time if you violate these Terms.",
              ),

              SizedBox(height: 20),

              _SectionTitle("7. Changes to Terms:"),

              SizedBox(height: 10),

              _BodyText(
                "We may update these Terms from time to time. Continued use of the App after changes means you accept the updated Terms.",
              ),

              SizedBox(height: 20),

              _SectionTitle("8. Contact Us:"),

              SizedBox(height: 10),

              _BodyText(
                "If you have any questions about these Terms, you can contact us at:",
              ),

              SizedBox(height: 6),

              _BodyText("your@email.com"),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// Widgets

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  final String text;
  const _TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;
  const _BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        height: 1.6,
        color: Colors.black54,
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String text;
  const _BulletText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ",
              style: TextStyle(fontSize: 13, color: Colors.black54)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                height: 1.6,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
