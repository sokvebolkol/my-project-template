class RegisterUserModel {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String password;

  RegisterUserModel({
    this.firstName = "",
    this.lastName = "",
    this.phoneNumber = "",
    this.email = "",
    this.password = "",
  });

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
      firstName: map["first_name"],
      lastName: map["last_name"],
      phoneNumber: map["phone"],
      email: map["email"],
      password: map["password"],
    );
  }

  Map<String, dynamic> toMap() => {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
