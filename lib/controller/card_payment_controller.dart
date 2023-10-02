import 'package:get/get.dart';

class CardDetailsController extends GetxController {
  RxString cardNumber = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cvc = ''.obs;

  void updateCardNumber(String number) => cardNumber.value = number;
  void updateCardHolderName(String name) => cardHolderName.value = name;
  void updateExpiryDate(String date) => expiryDate.value = date;
  void updateCVC(String cvcValue) => cvc.value = cvcValue;
}

final cardDetailsController = CardDetailsController();
