import 'package:flutter/material.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: BackButtonAppbar(title: "Privacy Policy"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // Date
              _TitleText("Effective Date: December 19, 2024"),

              SizedBox(height: 8),

              _BodyText(
                'Modily ("we," "us," or "our") is committed to protecting the privacy of our users ("you" or "your"). This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application, Modily (the "App").',
              ),

              SizedBox(height: 20),

              _SectionTitle("1. Information We Collect:"),

              SizedBox(height: 10),

              _BulletText(
                  "Account Information: When you create an account, we collect your email address, username (if chosen), and a secure password hash."),

              _BulletText(
                  "Usage Data: We collect data about your use of the App, such as features accessed, frequency of use, and journaling activity (without content)."),

              _BulletText(
                  "Optional Information: You may choose to provide additional information such as a profile picture or demographic data."),

              SizedBox(height: 20),

              _SectionTitle("2. How We Use Your Information:"),

              SizedBox(height: 10),

              _BulletText(
                  "Provide and Improve the App: We use your information to operate, maintain, and improve the App."),

              _BulletText(
                  "Personalize Your Experience: We may use your information to personalize your experience and provide content that supports your mental well-being."),

              _BulletText(
                  "Ensure Security: We use your data to keep your account safe and prevent misuse."),

              SizedBox(height: 20),

              _SectionTitle("3. Your Privacy Matters:"),

              SizedBox(height: 10),

              _BodyText(
                  "We understand that mental health is personal. We do not read or store your private journal content, and we do not sell your data to third parties."),

              SizedBox(height: 20),

              _SectionTitle("4. Data Protection:"),

              SizedBox(height: 10),

              _BodyText(
                  "We use appropriate security measures such as encryption and secure storage to protect your data."),

              SizedBox(height: 20),

              _SectionTitle("5. Your Choices:"),

              SizedBox(height: 10),

              _BodyText(
                  "You can update or delete your account at any time and choose what information you want to share."),

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