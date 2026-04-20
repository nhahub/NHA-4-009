class ApiConstants {
  // Base URLs
  static const String authUrl = "https://accept.paymob.com/api/auth/tokens";
  static const String orderRegUrl =
      "https://accept.paymob.com/api/ecommerce/orders";
  static const String paymentKeyUrl =
      "https://accept.paymob.com/api/acceptance/payment_keys";

  static const stripeBaseUrl = "https://api.stripe.com";
  static const googleBooksBaseUrl = "https://www.googleapis.com/books";

  // Payment
  static const createPaymentIntent = "/v1/payment_intents";
  static const createCustomer = "/v1/customers";
  static const createEphemeralKey = "/v1/ephemeral_keys";
  static const getRecommendedBooks =
      "/v1/volumes?q=subject:psychology+anxiety&maxResults=6";
}
