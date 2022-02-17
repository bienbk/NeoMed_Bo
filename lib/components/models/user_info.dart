// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.avatarUrl,
    required this.mobile,
    required this.mobileVerified,
    required this.nationalId,
    required this.nationalIdVerified,
    required this.recoveryQuestions,
    required this.recoveryQuestionsSet,
    required this.roles,
    required this.active,
    required this.socialLogin,
    required this.language,
    required this.address,
    required this.enabled,
    required this.authenticatorSecret,
    required this.country,
    required this.distributorId,
    this.role,
  });

  int id;
  String username;
  String password;
  String email;
  String firstName;
  String lastName;
  String gender;
  String? avatarUrl;
  String mobile;
  bool mobileVerified;
  String nationalId;
  bool nationalIdVerified;
  String recoveryQuestions;
  bool recoveryQuestionsSet;
  String roles;
  bool active;
  bool socialLogin;
  String language;
  String address;
  bool enabled;
  String authenticatorSecret;
  String country;
  int distributorId;
  Role? role;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["Id"],
        username: json["Username"],
        password: json["Password"],
        email: json["Email"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        gender: json["Gender"],
        avatarUrl: json["AvatarURL"],
        mobile: json["Mobile"],
        mobileVerified: json["MobileVerified"],
        nationalId: json["NationalID"],
        nationalIdVerified: json["NationalIDVerified"],
        recoveryQuestions: json["RecoveryQuestions"],
        recoveryQuestionsSet: json["RecoveryQuestionsSet"],
        roles: json["roles"],
        active: json["Active"],
        socialLogin: json["SocialLogin"],
        language: json["Language"],
        address: json["Address"],
        enabled: json["enabled"],
        authenticatorSecret: json["authenticator_secret"],
        country: json["Country"],
        distributorId: json["distributor_id"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Username": username,
        "Password": password,
        "Email": email,
        "FirstName": firstName,
        "LastName": lastName,
        "Gender": gender,
        "AvatarURL": avatarUrl ?? null,
        "Mobile": mobile,
        "MobileVerified": mobileVerified,
        "NationalID": nationalId,
        "NationalIDVerified": nationalIdVerified,
        "RecoveryQuestions": recoveryQuestions,
        "RecoveryQuestionsSet": recoveryQuestionsSet,
        "roles": roles,
        "Active": active,
        "SocialLogin": socialLogin,
        "Language": language,
        "Address": address,
        "enabled": enabled,
        "authenticator_secret": authenticatorSecret,
        "Country": country,
        "distributor_id": distributorId,
        "role": role == null ? null : role!.toJson(),
      };
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.unique,
    required this.distributorId,
    required this.createdAt,
    required this.updatedAt,
    required this.users,
  });

  int id;
  String name;
  String unique;
  int distributorId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic users;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        unique: json["unique"],
        distributorId: json["distributor_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        users: json["Users"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "unique": unique,
        "distributor_id": distributorId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "Users": users,
      };
}
