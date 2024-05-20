class CreatePatientModel {

  String firstName;
  String lastName;
  String phoneNumber;
  String gender;
  String dob;
  String description;

  CreatePatientModel({
    this.firstName = "",
    this.lastName = "",
    this.phoneNumber = "",
    this.gender = "",
    this.dob = "",
    this.description = "",
  });

  factory CreatePatientModel.fromMap(Map<String, dynamic> map) {

    return CreatePatientModel(
        firstName: map["first_name"],
        lastName: map["last_name"],
        phoneNumber: map["phone_number"],
        gender: map["gender"],
        dob: map["dob"],
        description: map["description"]);
  }

  Map<String, dynamic> toMap() => {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'gender': gender,
        'dob': dob,
        'description': description,
      };

  @override
  String toString() {
    return toMap().toString();
  }
}
