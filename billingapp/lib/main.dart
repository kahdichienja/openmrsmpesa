import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controller/payment_controller.dart';
import 'screens/onboarding_screen.dart';

void main() => runApp(

      MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PaymentController()),
      ],
      child: MyApp(),
    ),
  
  
  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.varelaRoundTextTheme(Theme.of(context).textTheme),
      ),
      home: OnboardingScreen(),
    );
  }
}
