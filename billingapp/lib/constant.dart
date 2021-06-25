import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kBackgroundColor = Color(0xffF9F9F9);
var kWhiteColor = Color(0xffffffff);
var kOrangeColor = Color(0xffEF716B);
var kBlueColor = Color(0xff4B7FFB);
var kYellowColor = Color(0xffFFB167);
var kTitleTextColor = Color(0xff1E1C61);
var kSearchBackgroundColor = Color(0xffF2F2F2);
var kSearchTextColor = Color(0xffC0C0C0);
var kCategoryTextColor = Color(0xff292685);




const white = Color(0xFFE3E3E3);

const appBgColor = Color(0xFFE3E3E3);
const primary = Color(0xFF008000);
const secondary = Color(0xFF19D5F1);
const black = Color(0xFF919191);
const blackThread = Color(0xFFE2E2E2);
const transparentColor = Colors.transparent;

class AppColors {
  static Color primaryWhite = Color(0xFFCADCED);
  static Color successColor = Colors.green[700];
  // //
  static EdgeInsets navPading = EdgeInsets.fromLTRB(70.0, 10, 70, 10);
  static EdgeInsets addFundPading = EdgeInsets.fromLTRB(40.0, 10, 70, 0);
  static EdgeInsets addRulePading = EdgeInsets.fromLTRB(40.0, 20, 280, 10);
  static EdgeInsets navPadingDivider = EdgeInsets.fromLTRB(70.0, 25, 70, 25);
  static EdgeInsets navThinPadingDivider = EdgeInsets.fromLTRB(70.0, 15, 70, 15);
  static EdgeInsets profilePading = EdgeInsets.fromLTRB(25.0, 5, 25, 10);
  static EdgeInsets addFundPadingDivider = EdgeInsets.fromLTRB(40.0, 10, 40, 0);

  static EdgeInsets navPading2 = EdgeInsets.fromLTRB(10.0, 60, 70, 10);
  static List pieColors = [
    Colors.green[400],
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.deepOrange,
    Colors.brown,
  ];

  static TextStyle kFontNavStyle = GoogleFonts.getFont('Roboto Mono', color:  Colors.white, fontWeight: FontWeight.w600, fontSize: 17);
  static TextStyle kFontStyle = GoogleFonts.getFont('Roboto Mono', color:  Colors.white,fontWeight: FontWeight.w200, fontSize: 17);
  static TextStyle kAddFundSubFontStyle = GoogleFonts.getFont('Roboto Mono', color:  Colors.white,fontWeight: FontWeight.w200, fontSize: 12);
  static TextStyle kActivityFontStyle = GoogleFonts.getFont('Roboto Mono',
      color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14);
  static TextStyle kProfileFontStyle = GoogleFonts.getFont('Roboto Mono', color:  Colors.white,fontWeight: FontWeight.w200, fontSize: 15);
  static TextStyle kAddFundFontStyle = GoogleFonts.getFont('Merriweather', color:  Colors.white,fontWeight: FontWeight.w300, fontSize: 15);
  static TextStyle kFontDollarStyle = GoogleFonts.getFont('Poppins', color:  Colors.white,fontWeight: FontWeight.w200, fontSize: 17);
  static TextStyle kFontBalanceStyle = GoogleFonts.getFont('Roboto Mono', color:  Colors.white,fontWeight: FontWeight.bold, fontSize: 25);
  static TextStyle kFontSeparatortyle = GoogleFonts.getFont('Roboto Mono',color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 50);
  static TextStyle kFontBalanceFigStyle = GoogleFonts.getFont('Merriweather', color:  Colors.white,fontWeight: FontWeight.w100, fontSize: 45);
  static TextStyle kFontAccountFigStyle = GoogleFonts.getFont('Merriweather', color:  Colors.white,fontWeight: FontWeight.w100, fontSize: 25);
  static TextStyle kEmailProfileFontAccountFigStyle = GoogleFonts.getFont('Merriweather', color:  Colors.white,fontWeight: FontWeight.w100,fontSize: 18);

  static List<Color> gradienColors = [
    Colors.green[400],
    Colors.green[900],
    Colors.green[900],
    Colors.green[600],
  ];
  static List<Color> gradienTInTabsColors = [
    Colors.green[900],
    Colors.green[800],
    Colors.green[700],
    Colors.green[600],
  ];
  static List<Color> gradienAppBarColors = [
    Colors.green[900],
    Colors.green[900],
  ];

  static List<Color> lightThemecontainerGradienGradientColors = [
    Color(0xFFE2E2E2),
    Color(0xFFE2E2E2),
    Color(0xFFE2E2E2),
  ];
  static List<Color> gradienAccountContainerColors = [
    Colors.green[400],
    Colors.green[900],
    Colors.green[900],
    Colors.green[600],
  ];
  static List<Color> gradienBalanceContainerLineGraphColors = [
    Colors.green[400],
    Colors.green[900],
    Colors.green[900],
  ];
  static List<BoxShadow> neumorpShadow = [
    BoxShadow(
        color: Colors.white.withOpacity(0.5),
        spreadRadius: -5,
        offset: Offset(-5, -5),
        blurRadius: 30),
    BoxShadow(
        color: Colors.green[900].withOpacity(.2),
        spreadRadius: 2,
        offset: Offset(7, 7),
        blurRadius: 20)
  ];

    static List<Color> containerGradienGradientColors = [
    Color(0xFF919191),
    Color(0xFFE2E2E2),
    Color(0xFF5E5E5E),
  ];
  static BoxDecoration containerBoxDecorations = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
    ),
    boxShadow: AppColors.neumorpShadow,
    gradient: LinearGradient(
      colors: AppColors.containerGradienGradientColors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
  static BoxDecoration buttonBoxDecorations = BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    gradient: LinearGradient(
      colors: AppColors.containerGradienGradientColors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

    static String validatePhoneNumber(String value) {
    // return CardUtils.validatePhoneNumber(value);
    // check if the phone number is empty
    if (value.length <= 10) {
      // print('less 10 digit');
      return Strings.phoneNumberLessDigit;
    } 
      if (value.isEmpty) {
        return Strings.fieldReq;
      }
      // check if the phone number startsWith 245
      if (value.startsWith('254')) {
        if (value.length < 12) {
          return Strings.phoneNumberLessDigit;
        } 
      }
      if (value.length != 12) {
          return Strings.phoneNumberLessDigit;
        } 
      if (!value.startsWith('254')) {
        return Strings.phoneNumberLessDigit;
      }
      if (value.startsWith('0')) {
        // replace the 1st digit
        // var re = RegExp(r'\d{1}');
        // print('correct2');
        // print(value.replaceFirst(re, '254'));

        return 'Phone Number Must Start With 254';
      }
    return null;
  }
 
}
class Strings {
  static const String fieldReq = 'This field is required';
  static const String phoneNumberLessDigit = 'Phone number MUST startwith 254';
}