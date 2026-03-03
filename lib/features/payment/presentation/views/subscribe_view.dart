import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../data/models/card_model.dart';
import '../manager/payment_cubit/payment_cubit.dart';
import '../manager/payment_cubit/payment_state.dart';
import '../widgets/payment_method_item.dart';
import '../widgets/payment_success_dialog.dart';

class SubscribeView extends StatefulWidget {
  const SubscribeView({super.key, this.price = 100.0});
  final double price;

  @override
  State<SubscribeView> createState() => _SubscribeViewState();
}

class _SubscribeViewState extends State<SubscribeView> {
  int selectedMethodIndex = 0;
  List<CardModel> savedCards = [];
  int selectedSavedCardIndex = -1;
  bool isLoadingCards = true;

  final List<Map<String, dynamic>> paymentMethods = [
    {'title': 'Paypal', 'icon': AppAssets.appleIcon, 'isSvg': true},
    {'title': 'Google Pay', 'icon': AppAssets.googleIcon, 'isSvg': true},
    {'title': 'Apple Pay', 'icon': AppAssets.appleIcon, 'isSvg': true},
  ];

  @override
  void initState() {
    super.initState();
    _loadSavedCards();
  }

  Future<void> _loadSavedCards() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cardsJson = prefs.getString('saved_cards');
      if (cardsJson != null) {
        setState(() {
          savedCards = CardModel.decode(cardsJson);
          if (savedCards.isNotEmpty) {
            selectedMethodIndex = 3;
            selectedSavedCardIndex = 0;
          }
        });
      }
    } catch (e) {
      debugPrint("Error loading cards: $e");
    } finally {
      setState(() => isLoadingCards = false);
    }
  }

  Future<void> _saveCards() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_cards', CardModel.encode(savedCards));
  }

  @override
  Widget build(BuildContext context) {
    CardModel? currentCard =
        (selectedMethodIndex == 3 &&
            selectedSavedCardIndex != -1 &&
            savedCards.length > selectedSavedCardIndex)
        ? savedCards[selectedSavedCardIndex]
        : null;

    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              AppAssets.arrowLeftIcon,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("الدفع", style: AppStyles.extraBold20),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.qr_code_scanner, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const PaymentSuccessDialog(),
              );
            } else if (state is PaymentFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                if (isLoadingCards)
                  const Center(child: CircularProgressIndicator())
                else
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currentCard != null) ...[
                          Container(
                            width: double.infinity,
                            height: 200,
                            margin: const EdgeInsets.only(bottom: 24),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xff59CF77), Color(0xff32B453)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.brandGreen.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Maestro Kard",
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
                                  currentCard.cardNumber,
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
                                      currentCard.holderName,
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
                        ],

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "طرق الدفع",
                              style: AppStyles.extraBold16,
                            ),
                            TextButton(
                              onPressed: () async {
                                final result = await context.push(
                                  Routes.addCardView,
                                );
                                if (result != null && result is CardModel) {
                                  setState(() {
                                    savedCards.add(result);
                                    selectedMethodIndex = 3;
                                    selectedSavedCardIndex =
                                        savedCards.length - 1;
                                  });
                                  _saveCards();
                                }
                              },
                              child: const Text(
                                "إضافة بطاقة جديدة",
                                style: TextStyle(
                                  color: AppColors.brandGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ...List.generate(paymentMethods.length, (index) {
                          return PaymentMethodItem(
                            title: paymentMethods[index]['title'],
                            iconPath: paymentMethods[index]['icon'],
                            isSelected: selectedMethodIndex == index,
                            onTap: () {
                              setState(() {
                                selectedMethodIndex = index;
                                selectedSavedCardIndex = -1;
                              });
                            },
                            isSvg: paymentMethods[index]['isSvg'],
                          );
                        }),

                        if (savedCards.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          const Text(
                            "الدفع باستخدام بطاقة الخصم/الائتمان",
                            style: AppStyles.extraBold16,
                          ),
                          const SizedBox(height: 16),
                          ...List.generate(savedCards.length, (index) {
                            return PaymentMethodItem(
                              title: savedCards[index].maskedNumber,
                              iconPath: AppAssets.cardDotIcon,
                              isSelected:
                                  selectedMethodIndex == 3 &&
                                  selectedSavedCardIndex == index,
                              onTap: () {
                                setState(() {
                                  selectedMethodIndex = 3;
                                  selectedSavedCardIndex = index;
                                });
                              },
                            );
                          }),
                        ],
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                if (state is PaymentLoading)
                  const Center(child: CircularProgressIndicator()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: AppTextButton(
                        onPressed: () {
                          context.read<PaymentCubit>().initiatePayment(
                            context: context,
                            amount: widget.price,
                            firstName:
                                currentCard?.holderName.split(" ").first ??
                                "User",
                            lastName:
                                currentCard?.holderName.split(" ").last ??
                                "Name",
                            email: "user@example.com",
                            phoneNumber: "+201234567890",
                          );
                        },
                        buttonText: "متابعة",
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
