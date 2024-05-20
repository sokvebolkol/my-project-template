List<Language> languageList = [
  Language(),
  Khmer(),
];

class Language {
  String get code                                => "EN";

  String get login                             => "Log In";

  String get authRegister                      => "REGISTER";

  String get logout                            => "Logout";

  String get deleteMyAccount                   => "Delete My Account";

  String get removeAccount                     => "Delete Account";

  String get msgRemoveAccount                  =>
      "Would you really like to delete your account?";

  String get register                          => " Register";

  String get contactPr                         => "Contact to PR";

  String get contactFinance                    => "Contact to Finance";

  String get dontHaveAccount                   => "Don't Have an Account? ";

  String get password                          => "Password";

  String get confirmPassword                   => "Confirm Password";

  String get enterPassword                     => "Enter Password";

  String get phoneNumber                       => "Phone Number";

  String get enterPhoneNumber                  => "Please enter phone number";

  String get phoneOrPassIncorrect              =>
      "Your phone number or password is incorrect";

  String get enterPhoneOrPass                  => "Please enter phone number or password";

  String get registerPatient                   => "Register Patient";

  String get yourReport                        => "Your Report";

  String get myReport                          => "MY REPORT";

  String get myProfile                         => "My Profile";

  String get termAndCondition                  => "Terms & Conditions";

  String get userAgreement                     => "User Agreement";

  String get privacyPolicy                     => "Privacy Policy";

  String get ok                                => "OK";

  String get cancel                            => "Cancel";

  String get returnToLogin                     => "You will be returned to login screen";

  String get firstName                         => "First Name";

  String get lastName                          => "Last Name";

  String get email                             => "Email";

  String get gender                            => "Gender";

  String get birthday                          => "Birthday";

  String get description                       => "Description";

  String get create                            => "CREATE";

  String get submit                            => "SUBMIT";

  String get reSubmit                          => "RESUBMIT";

  String get patientPreRegister                => "Patient Pre-Registration";

  String get menu                              => "Menu";

  String get reports                           => "Reports";

  String get totalBalance                      => "TOTAL BALANCE";

  String get totalSubmission                   => "Total Submission";

  String get actualPatients                    => "Actual Patients";

  String get patientInfo                       => "Patient Information";

  String get success                           => "Success";

  String get warning                           => "Warning";

  String get phoneIsExist                      => "Phone number is already existed";

  String get emailIsExist                      => "Email is already existed";

  String get patientRegistered                 => "Patient has been registered";

  String get patientResubmitted                => "Patient has been resubmitted";

  String get userRegistered                    => "User has been registered";

  String get userRegisterMsg                   =>
      "Your request is being reviewed by  the Admin. Thank you.";

  String get enterFNameOrLName                 => "Please enter first name or last name!";

  String get enterInvalidName                  => "First name or last name is invalid";

  String get emailIsInvalid                    => "Your Email is invalid!";

  String get checkPhoneNumber                  => "Please check phone number again!";

  String get passwordMissMatch                 => "Your Password do not match!";

  String get selectGender                      => "Please select gender!";

  String get enterBirthDay                     => "Please enter birthday!";

  String get enterDescription                  => "Please enter description!";

  String get passwordOrConfirmPassWordNotEmpty =>
      "Password & Confirm Password can't be empty!";

  String get passwordMustMoreFive              =>
      "Your Password Must Greater Than 5 Characters ";

  String get male                              => "Male";

  String get female                            => "Female";

  String get other                             => "Other";

  String get patients                          => "Total Patients";

  String get search                            => "Search";

  String get phone                             => "Phone";

  String get noPatient                         => "No Patients Found";

  String get noPatientFound                    => "There are no patients available at the moment.";

  String get upComingFeatures                  => "Up Coming Features";

  String get amountTobeReceived                => "Amount to be received";

  String get amountReceived                    => "Amount Received";

  String get additionalAmountToBeReceived      => "Additional amount to be received";

  String get bonusAmountReceived               => "Bonus amount received";

  String get changeLanguage                    => "Switch Language";

  String get bankName                          => "Bank Name";

  String get accountNumber                     => "Account Number";

  String get accountName                       => "Account Name";

  String get selectBranch                      => "Select Branch";

  String get chooseBranch                      => "Choose Branch";

  String get ord1                              => "Orienda 1";

  String get ord2                              => "Orienda 2";

  String get userType                          => "User Type";

  String get staffType                         => "Staff Type";

  String get internal                          => "Internal";

  String get external                          => "External";

  String get office                            => "Office or Nurse";

  String get doctor                            => "Doctor";

  String get attacheStaffID                    => "Please attache your staff ID card";

  String get selectPhoto                       => "Upload Staff ID";

  String get chooseOne                         => "Please choose one";

  String get camera                            => "Camera";

  String get gallery                           => "Gallery";

  String get requiredUserType                  => "Please select user type";

  String get requiredStaffType                 => "Please select staff type";

  String get requiredStaffIdCard               => "Please attache your staff ID card";

  String get settings                          => "Settings";

  String get moreInfo                          => "More Information";

  String get profileDesc                       => "Always keep the phone number\n updated or you may lose access to your Orienda Mobile";

  String get registerPhoneNumber               => "Registered Phone Number";

  String get userName                          => "User Name";

  String get myProfileAccount                  => "My Profile";

  String get commissionFee                     => "Commission Fee";

  String get recommendedPatient                => "Recommended Patients";

}

class Khmer implements Language {
  @override
  String get code                              => "KH";

  @override
  String get login                             => "ចូលប្រើប្រាស់";

  @override
  String get logout                            => "ចាកចេញ";

  @override
  String get deleteMyAccount                   => "ធ្វើការលុបគណនី";

  @override
  String get removeAccount                     => "ធ្វើការលុបគណនី";

  @override
  String get msgRemoveAccount                  => "តើអ្នកចង់លុបគណនីរបស់អ្នកមែនទេ?";

  @override
  String get register                          => "ចុះឈ្មោះ";

  @override
  String get contactPr                         => "ទាក់ទងទៅកាន់ PR";

  @override
  String get contactFinance                    => "ទាក់ទងទៅកាន់ Finance";

  @override
  String get dontHaveAccount                   => "មិនទាន់មានគណនីទេ?";

  @override
  String get password                          => "លេខសម្ងាត់";

  @override
  String get enterPassword                     => "សូមបញ្ចូលលេខសម្ងាត់";

  @override
  String get phoneNumber                       => "លេខទូរស័ព្ទ";

  @override
  String get enterPhoneNumber                  => "សូមបញ្ចូលលេខទូរស័ព្ទ";

  @override
  String get registerPatient                   => "ចុះឈ្មោះអ្នកជំងឺ";

  @override
  String get yourReport                        => "របាយការណ៍របស់អ្នក";

  @override
  String get myReport                          => "របាយការណ៍របស់ខ្ញុំ";

  @override
  String get myProfile                         => "ពត៌មានរបស់ខ្ញុំ";

  @override
  String get termAndCondition                  => "រយៈពេលនិងលក្ខខណ្ឌ";

  @override
  String get userAgreement                     => "កិច្ចព្រមព្រៀងការប្រើប្រាស់";

  @override
  String get privacyPolicy                     => "គោលការណ៍ឯកជនភាព";

  @override
  String get ok                                => "យល់ព្រម";

  @override
  String get cancel                            => "បោះបង់";

  @override
  String get returnToLogin                     => "អ្នកនឹងត្រូវត្រឡប់ទៅកាន់អេក្រង់ចូលប្រើប្រាស់";

  @override
  String get firstName                         => "នាមខ្លួន";

  @override
  String get lastName                          => "នាមត្រកូល";

  @override
  String get gender                            => "ភេទ";

  @override
  String get birthday                          => "ថ្ងៃខែឆ្នាំកំណើត";

  @override
  String get description                       => "ការពិពណ៌នា";

  @override
  String get create                            => "បង្កើត";

  @override
  String get submit                            => "ដាក់ស្នើ";

  @override
  String get reSubmit                          => "ដាក់ស្នើម្តងទៀត";

  @override
  String get patientPreRegister                => "ចុះឈ្មោះអ្នកជម្ងឺ";

  @override
  String get menu                              => "មុឺនុយ";

  @override
  String get totalSubmission                   => "ចំនួនអ្នកជម្ងឺបានចុះឈ្មោះ";

  @override
  String get actualPatients                    => "ចំនួនអ្នកជម្ងឺបានប្រើសេវាកម្ម";

  @override
  String get reports                           => "របាយការណ៍";

  @override
  String get totalBalance                      => "សរុបសមតុល្យ";

  @override
  String get enterPhoneOrPass                  => "សូមបញ្ចូលលេខទូរស័ព្ទឬលេខសំងាត់";

  @override
  String get phoneOrPassIncorrect              => "លេខទូរស័ព្ទឬពាក្យសំងាត់មិនត្រឹមត្រូវ";

  @override
  String get patientInfo                       => "ព័ត៌មានអ្នកជម្ងឺ";

  @override
  String get success                           => "ជោគជ័យ";

  @override
  String get warning                           => "ព្រមាន";

  @override
  String get phoneIsExist                      => "លេខទូរស័ព្ទធ្លាប់បានចុះឈ្មោះម្តងហើយ";

  @override
  String get emailIsExist                      => "អុីម៉ែលធ្លាប់បានចុះឈ្មោះម្តងហើយ";

  @override
  String get patientRegistered                 => "អ្នកជម្ងឺចុះឈ្មោះទទួលបានជោគជ័យ";

  @override
  String get patientResubmitted                => "អ្នកជម្ងឺចុះឈ្មោះម្តងទៀតទទួលបានជោគជ័យ";

  @override
  String get userRegistered                    => "ចុះឈ្មោះទទួលបានជោគជ័យ";

  @override
  String get userRegisterMsg                   =>
      "សូមអរគុណសម្រាប់ការដាក់ស្នើរបស់អ្នក។ សូមរងចាំអ្នកគ្រប់គ្រងរៀបចំទិន្នន័យរបស់អ្នក។";

  @override
  String get female                            => "ស្រី";

  @override
  String get male                              => "ប្រុស";

  @override
  String get other                             => "ផ្សេងៗ";

  @override
  String get patients                          => "អ្នកជម្ងឺសរុប";

  @override
  String get search                            => "ស្វែងរក";

  @override
  String get phone                             => "លេខទូរស័ព្ទ";

  @override
  String get noPatient                         => "មិនមានអ្នកជម្ងឺ";

  @override
  String get noPatientFound                    => "មិនមានអ្នកជម្ងឺត្រូវបានស្វែងរកឃើញទេ";

  @override
  String get email                             => "អុីម៉ែល";

  @override
  String get confirmPassword                   => "បញ្ចាក់លេខសម្ងាត់";

  @override
  String get authRegister                      => "ចុះឈ្មោះ";

  @override
  String get checkPhoneNumber                  => "សូមត្រួតពិនិត្យលេខទូរស័ព្ទម្តងទៀត";

  @override
  String get emailIsInvalid                    => "សូមត្រួតពិនិត្យអុីម៉ែលម្តងទៀត";

  @override
  String get enterFNameOrLName                 => "សូមបញ្ចូលឈ្មោះអោយបានត្រឹមត្រូវ";

  @override
  String get enterInvalidName                  => "នាមខ្លួនឬនាមត្រកូលមិនត្រឹមត្រូវ";

  @override
  String get passwordMissMatch                 => "លេខសម្ងាត់មិនរបស់អ្នកត្រូវគ្នា";

  @override
  String get passwordOrConfirmPassWordNotEmpty => "សូមបញ្ចូលលេខសម្ងាត់";

  @override
  String get selectGender                      => "សូមជ្រើសរើសភេទ";

  @override
  String get enterBirthDay                     => "សូមបញ្ចូលថ្ងៃខែឆ្នាំកំណើត";

  @override
  String get enterDescription                  => "សូមបញ្ចូលការពិពណ៌នា";

  @override
  String get passwordMustMoreFive              =>
      "ពាក្យសម្ងាត់របស់អ្នកត្រូវតែធំជាង 5 តួអក្សរ";

  @override
  String get upComingFeatures                  => "មុខងារថ្មីៗនឹងមកដល់នាពេលខាងមុខ";

  @override
  String get amountTobeReceived                => "ចំនួនទឹកប្រាក់ត្រូវទទួល";

  @override
  String get amountReceived                    => "ចំនួនទឹកប្រាក់បានទទួល";

  @override
  String get additionalAmountToBeReceived      => "ចំនួនទឹកប្រាក់បន្ថែមត្រូវទទួល";

  @override
  String get bonusAmountReceived               => "ចំនួនទឹកប្រាក់បន្ថែមបានទទួល";

  @override
  String get changeLanguage                    => "ប្តូរភាសារទៅជាអង់គ្លេស";

  @override
  String get bankName                          => "បញ្ចូលឈ្មោះធនាគារ";

  @override
  String get accountNumber                     => "បញ្ចូលលេខគណនី";

  @override
  String get accountName                       => "បញ្ចូលឈ្មោះគណនី";

  @override
  String get selectBranch                      => "ជ្រើសរើសសាខា";

  @override
  String get chooseBranch                      => "ជ្រើសរើសសាខា";

  @override
  String get ord1                              => "អូរៀនដាទី១";

  @override
  String get ord2                              => "អូរៀនដាទី២";

  @override
  String get userType                          => "អ្នកប្រើប្រាស់";

  @override
  String get staffType                         => "ប្រភេទបុគ្គលិក";

  @override
  String get internal                          => "បុគ្គលិក";

  @override
  String get external                          => "មិនមែនបុគ្គលិក";

  @override
  String get office                            => "បុគ្គលិកការិយាល័យ";

  @override
  String get doctor                            => "ដុកទ័រ";

  @override
  String get attacheStaffID                    => "សូមភ្ជាប់ជាមួយកាតសម្គាល់បុគ្គលិក";

  @override
  String get selectPhoto                       => "ជ្រើសរើស Staff ID";

  @override
  String get chooseOne                         => "ជ្រើសរើស";

  @override
  String get camera                            => "កាមេរ៉ា";

  @override
  String get gallery                           => "វិចិត្រសាល";

  @override
  String get requiredUserType                  => "សូមជ្រើសរើសប្រភេទអ្នកប្រើប្រាស់";

  @override
  String get requiredStaffType                 => "សូមជ្រើសរើសប្រភេទបុគ្គលិក";

  @override
  String get requiredStaffIdCard               => "សូមភ្ជាប់ជាមួយកាតសម្គាល់បុគ្គលិក";

  @override
  String get settings                           => "ការកំណត់";

  @override
  String get moreInfo                          => "ពត៌មានបន្ថែម";

  @override
  String get profileDesc                       => "រក្សាលេខទូរស័ព្ទ\n ធ្វើបច្ចុប្បន្នភាពជានិច្ច បើមិនដូច្នោះទេ អ្នកអាចបាត់បង់សិទ្ធិចូលប្រើ Orienda Mobile របស់អ្នក";

  @override
  String get registerPhoneNumber               => "លេខទូរស័ព្ទដែលបានចុះឈ្មោះ";

  @override
  String get userName                          => "ឈ្មោះអ្នកប្រើប្រាស់";

  @override
  String get myProfileAccount                   => "ប្រូហ្វាល់របស់ខ្ញុំ";

  @override
  String get commissionFee                   => "កម្រៃជើងសារ";

  @override
  String get recommendedPatient                   => "អ្នកជំងឺដែលបានណែនាំ";
}
