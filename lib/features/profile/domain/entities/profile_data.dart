import 'package:flutter/cupertino.dart';

class ProfileData {
  final int id;
  final String name;
  final String firstname;
  final String lastname;
  final TextEditingController fullName ;
  final String status;
  final String userType;
  final TextEditingController email;
  final String? emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProfileData({
    required this.id,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.fullName,
    required this.email,
    required this.status,
    required this.userType,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      fullName: TextEditingController(text: json['name']??''),

      name: json['name'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      status: json['status'],
      userType: json['user_type'],
      email: TextEditingController(text: json['email']??''),
      emailVerifiedAt: json['email_verified_at'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
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
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}