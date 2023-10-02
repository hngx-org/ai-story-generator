import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_export.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  String selectedPlan = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Image.asset(
            ImageConstant.smallAppLogo,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel_sharp),
            onPressed: () {
              // Navigate to the profile screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 220.0,
              width: double.infinity,
              child: Image.asset(
                ImageConstant.planCategoryImage,
              ),
            ),
            Text(
              "7 days Free Trial\nGet Unlimited Access",
              style: GoogleFonts.abrilFatface(
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.normal,
                  color: AppTheme.welcomeTextColor,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "When you subscribe, you’ll gain\ninstant unlimited access. ",
              style: GoogleFonts.abrilFatface(
                textStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: AppTheme.black50Color,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlanOption(
                title: "Monthly",
                price: "\$4.99/month",
                isSelected: selectedPlan == "Monthly Plan",
                onSelected: () {
                  setState(() {
                    selectedPlan = "Monthly Plan";
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlanOption(
                title: "Annually",
                price: "\$49.99/year",
                isSelected: selectedPlan == "Annual Plan",
                onSelected: () {
                  setState(() {
                    selectedPlan = "Annual Plan";
                  });
                },
              ),
            ),
            Text(
              "Recuring billing, cancel anytime",
              style: GoogleFonts.abrilFatface(
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  color: AppTheme.welcomeTextColor,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "This app subscription offers recurring billing,\nallowing you to be charged periodically, while also\ngiving you the flexibility to cancel your subscription at any time.",
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  height: 1.2,
                  color: AppTheme.welcomeTextColor,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: getProportionateScreenWidth(342),
              height: getProportionateScreenHeight(60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                ),
                onPressed: () {
                  // Navigate to Sign In or Sign Up screen
                },
                child: Text(
                  "PURCHASE",
                  style: GoogleFonts.abhayaLibre(
                    textStyle: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanOption extends StatelessWidget {
  final String title;
  final String price;
  final bool isSelected;
  final VoidCallback onSelected;

  const PlanOption({
    super.key,
    required this.title,
    required this.price,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color containerColor = isSelected
        ? AppTheme.plansContainerColor
        : Colors.white; // Container color
    Color borderColor =
        isSelected ? AppTheme.plansContainerColor : Colors.grey; // Border color
    return InkWell(
      onTap: onSelected,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor, // Border color based on selection
            width: 2.0, // Border width
          ),
          color: containerColor, // Container color based on selection
          borderRadius: BorderRadius.circular(8.0), // Border radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.abrilFatface(
                        textStyle: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.normal,
                          color: AppTheme.welcomeTextColor,
                        ),
                       
                      ),
                    ),
                    Text(
                      price,
                      style: GoogleFonts.abrilFatface(
                        textStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: AppTheme.black70Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomRadio(isSelected: isSelected),
              SizedBox(width: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRadio extends StatelessWidget {
  final bool isSelected;

  CustomRadio({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppTheme.selectColor, // Border color for the radio button
          width: 4.0, // Border width for the radio button
        ),
        color: isSelected
            ? AppTheme.primaryColor
            : AppTheme.selectColor, // Fill color for the radio button
      ),
      child: Center(
        child: isSelected
            ? Icon(
                Icons.circle,
                size: 24.0,
                color: AppTheme.primaryColor, // Color of the checkmark
              )
            : null,
      ),
    );
  }
}