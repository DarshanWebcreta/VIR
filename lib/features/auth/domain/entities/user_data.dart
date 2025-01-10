class UserData {
  final int id;
  final String name;
  final String firstname;
  final String lastname;
  final String status;
  final String userType;
  final String email;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.status,
    required this.userType,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      status: json['status'],
      userType: json['user_type'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'firstname': firstname,
      'lastname': lastname,
      'status': status,
      'user_type': userType,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}