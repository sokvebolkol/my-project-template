/**
 * App colors
 */

const ccfPrimary = 0xFF0fbab5;
const ccfSecondary = 0xFF052744;
const primary = 0xFF8F6C45;
const primaryDark = 0xFF4c3e29;
const secondary = 0xFF5F5656;
const info = 0xFF1E9FDA;
const warning = 0xFFF9A220;
const success = 0xFF27AE37;
const black = 0xFF070606;
const blue = 0xFF4075EA;
const danger = 0xFFE83F16;
const normalText = 0xFFF5F5656;
const gray = 0xFFE9E9E9;
const dark = 0xFF242134;
const lightDark = 0xFF373447;
const lightGray = 0xFFCCCCCC;
const lightBlue = 0xFFADD8E6;
const lightGreen = 0xFF90EE90;
const textLabel = 0xFF9693A8;
const bgLight   = 0xFF1506063d;
const telegram   = 0xFF219ed9;

/**
 * App size and font
 */

const defaultPadding = 16.0;
const defaultMargin  = 10.0;
const strongText     = 20.0;
const title          = 18.0;
const subTitle       = 16.0;
const label          = 14.0;
const textNormal     = 12.0;
const textLight      = 10.0;
const smallText      = 8.0;

enum LoadingStatus {
  none,
  loading,
  error,
  done,
}

// Validation for email address
bool validateEmail(String email) {
  bool isValid = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
      .hasMatch(email);
  return isValid;
}

// Patient status
const patientCanResubmit = '2';
const actualPatient      = '1';

// Type of staffs
const internalStaff = "internal";
const externalStaff = "external";
const officeStaff   = "office";
const doctorStaff   = "doctor";

const internal = 1;
const external = 2;
const office   = 1;
const doctor   = 2;


// Function to check if the input contains a number
bool isNumber(String input) {
  final numberRegex = RegExp(r'^[0-9]+$');
  return numberRegex.hasMatch(input);
}

// Function to check if the input contains an emoji
bool isEmoji(String input) {
  final emojiRegex = RegExp(
    r'[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{2600}-\u{26FF}\u{2700}-\u{27BF}]',
    unicode: true,
  );
  return emojiRegex.hasMatch(input);
}





