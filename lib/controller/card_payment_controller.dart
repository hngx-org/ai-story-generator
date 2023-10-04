import 'package:get/get.dart';

class CardDetailsController extends GetxController {
  RxString cardNumber = ''.obs;
  RxString cardExpiry = ''.obs;
  RxString cardCVC = ''.obs;

  RxBool isCardNumberValid = true.obs;
  RxBool isExpiryDateValid = true.obs;
  RxBool isCVCValid = true.obs;

  void updateCardNumber(String number) {
    // Remove any non-digit characters
    final cleanNumber = number.replaceAll(RegExp(r'\D'), '');

    // Format the card number with spaces every four digits
    final formattedNumber = formatCardNumber(cleanNumber);

    cardNumber.value = formattedNumber;
    isCardNumberValid.value = validateCardNumber(cleanNumber);
  }


  void updateCardExpiry(String expiry) {
    cardExpiry.value = expiry;
    isExpiryDateValid.value = validateExpiryDate(expiry);
  }

  void updateCardCVC(String cvc) {
    cardCVC.value = cvc;
    isCVCValid.value = validateCVC(cvc);
  }

  // Implement your card validation logic here

  bool validateCardNumber(String number) {
    // Implement card number validation logic
    return number.length == 16; // Example: Card number should have 16 digits
  }

  bool validateExpiryDate(String expiry) {
    // Implement expiry date validation logic
    return expiry.length == 5; // Example: MM/YY format
  }

  bool validateCVC(String cvc) {
    // Implement CVC validation logic
    return cvc.length == 3; // Example: CVC should have 3 digits
  }

  String formatCardNumber(String cardNumber) {
    if (cardNumber.length <= 4) {
      return cardNumber;
    }

    final formattedNumber = StringBuffer();
    for (int i = 0; i < cardNumber.length; i++) {
      if (i % 4 == 0 && i != 0) {
        formattedNumber.write(' '); // Add a space every four digits
      }
      formattedNumber.write(cardNumber[i]);
    }
    return formattedNumber.toString();
  }
}

final cardDetailsController = CardDetailsController();

