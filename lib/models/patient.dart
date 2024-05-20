class Patient {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String date;
  final String dob;
  final String gender;
  final String description;
  final String status;

  Patient({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.date,
    required this.dob,
    required this.gender,
    required this.description,
    required this.status,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      date: json['created'],
      dob: json['date_of_birth'],
      gender: json['gender'],
      description: json['description'],
      status: json['status'],
    );
  }
}
