
class UserModel {
  final String username;
  final String token;

  UserModel({required this.username, required this.token});
}

class UserApproval {
  final String userApproval;

  UserApproval({required this.userApproval});

  factory UserApproval.fromJson(Map<String, dynamic> json) {
    return UserApproval(
      userApproval: json['manager'],
    );
  }
}
