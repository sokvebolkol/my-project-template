class Profile {
  String? userId;
  String phone;
  String photo1;
  String? photo2;
  String name;
  String? profile;
  String? bankName;
  String? bankAccount;
  String? bankNumber;

  Profile(
      {this.userId,
      required this.phone,
      required this.photo1,
      this.photo2,
      required this.name,
      this.profile,
      this.bankName,
      this.bankAccount,
      this.bankNumber});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      userId: json['data']?['user_id']?.toString(),
      phone: json['data']?['phone'],
      photo1: json['data']?['photo1'],
      photo2: json['data']?['photo2'],
      name: json['data']?['name'],
      profile: json['data']?['profile'],
      bankName: json['data']?['bank_name'],
      bankAccount: json['data']?['account_name'],
      bankNumber: json['data']?['account_number'],
    );
  }
}
