import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/app_export.dart';

class CardPaymentScreen extends StatefulWidget {
  final String planPrice;

  const CardPaymentScreen({
    super.key,
    required this.planPrice,
  });

  @override
  _CardPaymentScreenState createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  String selectedCountry = 'Nigeria'; // Default country
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Payment"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20.0),
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Image.asset(
                  ImageConstant.cardPaymentImage,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Card Information",
                style: GoogleFonts.abhayaLibre(
                  textStyle: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.blackColor,
                  ),
                ),
              ),
              // create input field with a border box container
              Container(
                height: 120.0,
                margin: const EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppTheme.blackColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Card Number",
                        hintStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          color: AppTheme.blackColor,
                        ),
                        contentPadding: EdgeInsets.only(left: 10.0),
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "MM/YY",
                              hintStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                                color: AppTheme.blackColor,
                              ),
                              contentPadding: EdgeInsets.only(left: 10.0),
                            ),
                          ),
                        ),
                        
                        VerticalDivider(
                          color: AppTheme.blackColor,
                          width: 2,
                        ), // Add a vertical divider between MM/YY and CVC
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "CVC",
                              hintStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,
                                color: AppTheme.blackColor,
                              ),
                              contentPadding: EdgeInsets.only(left: 10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "Country or Region",
                style: GoogleFonts.abhayaLibre(
                  textStyle: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.blackColor,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              // input field
              DropdownButton<String>(
                value: selectedCountry,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: GoogleFonts.abhayaLibre(
                  textStyle: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.blackColor,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCountry = newValue!;
                  });
                },
                items: <String>['Nigeria', 'Ghana', 'Kenya', 'South Africa']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: GoogleFonts.abhayaLibre(
                          textStyle: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                            color: AppTheme.blackColor,
                          ),
                        )),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              AppButton(
                onPressed: () {
                  // Process the card payment here
                  // You would typically integrate a payment gateway for this
                  // After successful payment, you can navigate to a confirmation screen
                },
                buttonText: "Pay",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
