// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:in_app_payment/in_app_payment.dart';
// import '../../controller/card_payment_controller.dart';
// import '../../core/app_export.dart';
// import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
// // import 'package:flutter/foundation.dart' show kIsWeb;

// class CardPaymentScreen extends StatefulWidget {
//   final String planPrice;

//   const CardPaymentScreen({
//     super.key,
//     required this.planPrice,
//   });

//   @override
//   _CardPaymentScreenState createState() => _CardPaymentScreenState();
// }

// class _CardPaymentScreenState extends State<CardPaymentScreen> {
//   String selectedCountry = 'Nigeria'; // Default country
//   final pay = HNGPay();

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//     return Scaffold(
//       backgroundColor: AppTheme.whiteColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(
//             Icons.keyboard_arrow_left,
//             size: getProportionateScreenWidth(30),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 120,
//                 width: double.infinity,
//                 child: SvgPicture.asset(
//                   ImageSvgConstant.cardPaymentImage,
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//               Text(
//                 "Card Information",
//                 style: GoogleFonts.abhayaLibre(
//                   textStyle: const TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.w500,
//                     color: AppTheme.blackColor,
//                   ),
//                 ),
//               ),
//               // Create input field with a border box container
//               Container(
//                 height: 120.0,
//                 margin: const EdgeInsets.only(top: 10.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: AppTheme.blackColor,
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Column(
//                   children: [
//                     TextField(
//                       keyboardType: TextInputType.number,
//                       onChanged: cardDetailsController.updateCardNumber,
//                       // Update card number and validate
//                       inputFormatters: [
//                         CreditCardNumberInputFormatter(),
//                       ], // Accept only numbers
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Card Number",
//                         hintStyle: const TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.w300,
//                           color: AppTheme.blackColor,
//                         ),
//                         contentPadding:
//                             const EdgeInsets.only(left: 10.0, top: 15),
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Icon(
//                             Icons.credit_card_rounded,
//                             color: AppTheme.black50Color,
//                             size: 30,
//                           ),
//                         ),
//                         errorText: cardDetailsController.isCardNumberValid.value
//                             ? null
//                             : "Invalid Card Number",
//                       ),
//                     ),
//                     const Divider(),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             keyboardType: TextInputType.number,
//                             onChanged: cardDetailsController.updateCardExpiry,
//                             // Update expiry date and validate
//                             inputFormatters: [
//                               CreditCardExpirationDateFormatter(),
//                             ], // Accept only numbers
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "MM/YY",
//                               hintStyle: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.w300,
//                                 color: AppTheme.blackColor,
//                               ),
//                               contentPadding: EdgeInsets.only(left: 10.0),
//                               errorText:
//                                   cardDetailsController.isExpiryDateValid.value
//                                       ? null
//                                       : "Invalid Expiry Date",
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 1,
//                           height: 54,
//                           color: Colors.black26,
//                         ),
//                         Expanded(
//                           child: TextField(
//                             keyboardType: TextInputType.number,
//                             onChanged: cardDetailsController.updateCardCVC,
//                             // Update CVC and validate
//                             inputFormatters: [
//                               CreditCardCvcInputFormatter(),
//                             ], // Accept only numbers
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "CVC",
//                               hintStyle: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.w300,
//                                 color: AppTheme.blackColor,
//                               ),
//                               contentPadding: EdgeInsets.only(left: 10.0),
//                               errorText: cardDetailsController.isCVCValid.value
//                                   ? null
//                                   : "Invalid CVC",
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "Country or Region",
//                 style: GoogleFonts.abhayaLibre(
//                   textStyle: const TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.w500,
//                     color: AppTheme.blackColor,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5.0),
//               // Input field
//               Container(
//                 height: 55,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: DropdownButton<String>(
//                   underline: Container(),
//                   value: selectedCountry,
//                   isExpanded: true,
//                   icon: Icon(
//                     Icons.keyboard_arrow_down_rounded,
//                     size: getProportionateScreenWidth(30),
//                   ),
//                   elevation: 0,
//                   style: GoogleFonts.abhayaLibre(
//                     textStyle: const TextStyle(
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.w500,
//                       color: AppTheme.blackColor,
//                     ),
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedCountry = newValue!;
//                     });
//                   },
//                   items: <String>['Nigeria', 'Ghana', 'Kenya', 'South Africa']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(value,
//                             style: GoogleFonts.abhayaLibre(
//                               textStyle: const TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.w300,
//                                 color: AppTheme.blackColor,
//                               ),
//                             )),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//               // Platform.isAndroid
//               //     ?
//               SizedBox(
//                 width: double.infinity,
//                 height: getProportionateScreenHeight(50),
//                 child: pay.googlePay(amountToPay: widget.planPrice),
//               )
//               // : Platform.isIOS
//               //     ? Center(
//               //         child: pay.applePay(amountToPay: widget.planPrice),
//               //       )
//               //     : SizedBox()

//               // AppButton(
//               //   onPressed: ()async {
//               //     // if (Platform.isAndroid) {
//               //     print('pressed');
//               //    await pay.googlePay(amountToPay: widget.planPrice);
//               //     // } else if (Platform.isIOS) {
//               //     //   pay.applePay(amountToPay: widget.planPrice);
//               //     // } else {}
//               //   },
//               //   buttonText: "PAY ${widget.planPrice}",
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
