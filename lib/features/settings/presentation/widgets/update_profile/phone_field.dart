import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class PhoneField extends StatefulWidget {
  final void Function(String phone)? onInputChanged;
  const PhoneField({super.key, required this.onInputChanged});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late TextEditingController _phoneNumberController;

  PhoneNumber initialNumber = PhoneNumber(isoCode: 'EG');

  bool _isValid = false;

  @override
  void initState() {
    super.initState();

    _phoneNumberController = TextEditingController();

    _loadInitialNumber();
  }

  Future<void> _loadInitialNumber() async {
    final storedNumber = getUser()?.phone;

    if (storedNumber == null || storedNumber.isEmpty) return;

    try {
      final number = await PhoneNumber.getRegionInfoFromPhoneNumber(
        storedNumber,
        'EG',
      );

      setState(() {
        initialNumber = number;
        _phoneNumberController.text = number.parseNumber();
      });
    } catch (e) {
      _phoneNumberController.text = storedNumber;
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      cursorColor: AppColors.brandGreen,
      textFieldController: _phoneNumberController,
      initialValue: initialNumber,
      formatInput: true,
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.onUserInteraction,

      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        leadingPadding: 20,
        trailingSpace: false,
        useBottomSheetSafeArea: true,
        setSelectorButtonAsPrefixIcon: true,
      ),
      searchBoxDecoration: InputDecoration(
        focusedBorder: buildOutLineInputBorder(
          borderColor: AppColors.lightGrey,
        ),
        enabledBorder: buildOutLineInputBorder(
          borderColor: AppColors.lightGrey,
        ),
        prefixIcon: const Icon(Icons.search, color: AppColors.linkGray),
        filled: true,
        fillColor: Colors.white,
      ),
      inputDecoration: InputDecoration(
        hintText: 'Phone Number',
        hintStyle: AppStyles.medium15.copyWith(color: AppColors.linkGray),

        focusedBorder: buildOutLineInputBorder(
          borderColor: AppColors.lightGrey,
        ),
        enabledBorder: buildOutLineInputBorder(
          borderColor: AppColors.borderButton.withAlpha((255 * 0.15).toInt()),
        ),
        errorBorder: buildOutLineInputBorder(borderColor: AppColors.darkRed),
        focusedErrorBorder: buildOutLineInputBorder(
          borderColor: AppColors.darkRed,
        ),
        filled: true,
        fillColor: Colors.white,
      ),

      onInputChanged: (PhoneNumber number) {
        final phone = number.phoneNumber ?? '';
        widget.onInputChanged?.call(phone);
      },

      onInputValidated: (bool isValid) {
        _isValid = isValid;
      },

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your phone number";
        }
        if (!_isValid) {
          return "Please enter a valid phone number";
        }
        return null;
      },

      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: false,
      ),
    );
  }
}

OutlineInputBorder buildOutLineInputBorder({required Color borderColor}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: borderColor, width: 1.3),
    borderRadius: BorderRadius.circular(15),
  );
}
