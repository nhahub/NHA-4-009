import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../data/models/card_model.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    holderNameController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(AppAssets.arrowLeftIcon, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "بطاقة دفع جديدة",
          style: AppStyles.extraBold20.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Card Preview
            ValueListenableBuilder(
              valueListenable: holderNameController,
              builder: (context, _, __) => ValueListenableBuilder(
                valueListenable: cardNumberController,
                builder: (context, _, __) => Container(
                  width: double.infinity,
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 32),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff59CF77), Color(0xff32B453)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Master Card",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SvgPicture.asset(
                            AppAssets.zenspunLogo,
                            width: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        cardNumberController.text.isEmpty
                            ? ".... .... .... ...."
                            : cardNumberController.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Holder Name",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            holderNameController.text.isEmpty
                                ? "Full Name"
                                : holderNameController.text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Form Fields
            _buildTextField(
              controller: holderNameController,
              hint: "Hazem Hamdy",
              label: "Holder Name",
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: cardNumberController,
              hint: "1234 5678 1234 5678",
              label: "Card Number",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: expiryController,
                    hint: "02/30",
                    label: "Expiry Date",
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    controller: cvvController,
                    hint: "123",
                    label: "CVV",
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                onPressed: () {
                  final newCard = CardModel(
                    holderName: holderNameController.text,
                    cardNumber: cardNumberController.text,
                    expiryDate: expiryController.text,
                    cvv: cvvController.text,
                  );
                  Navigator.pop(context, newCard);
                },
                buttonText: "Add New Card",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
            ),
            onChanged: (value) => setState(() {}),
          ),
        ),
      ],
    );
  }
}
