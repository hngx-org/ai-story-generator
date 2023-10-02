import 'package:ai_story_generator/screens/ai_stories/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_export.dart';
import 'card_payment.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  String selectedPlan = '';

  @override
  void initState() {
    // navigate();
    // TODO: implement initState
    super.initState();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(const DashBoardScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          child: Image.asset(
            ImageConstant.smallAppLogo,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.off(const DashBoardScreen());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(220),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardPaymentScreen(
                          planPrice: "\$4.99/year",
                        ),
                      ),
                    );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardPaymentScreen(
                          planPrice: "\$49.99/year",
                        ),
                      ),
                    );
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
              SizedBox(height: getProportionateScreenHeight(30)),
              SizedBox(
                width: getProportionateScreenWidth(342),
                height: getProportionateScreenHeight(60),
                child: AppButton(
                  buttonText: 'Purchase',
                  onPressed: () {},
                ),
              ),
            ],
          ),
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
