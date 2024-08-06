// To parse this JSON data, do
//
//     final logInRes = logInResFromJson(jsonString);

import 'dart:convert';

LogInRes logInResFromJson(String str) => LogInRes.fromJson(json.decode(str));

String logInResToJson(LogInRes data) => json.encode(data.toJson());

class LogInRes {
  String message;
  int statusCode;
  Data data;

  LogInRes({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory LogInRes.fromJson(Map<String, dynamic> json) => LogInRes(
        message: json["message"],
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": data.toJson(),
      };
}

class Data {
  User user;
  bool hasActiveSubscription;
  Credentials credentials;

  Data({
    required this.user,
    required this.hasActiveSubscription,
    required this.credentials,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        hasActiveSubscription: json["hasActiveSubscription"],
        credentials: Credentials.fromJson(json["credentials"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "hasActiveSubscription": hasActiveSubscription,
        "credentials": credentials.toJson(),
      };
}

class Credentials {
  String schema;
  String accessToken;
  String refreshToken;
  int expiresIn;

  Credentials({
    required this.schema,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) => Credentials(
        schema: json["schema"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
      );

  Map<String, dynamic> toJson() => {
        "schema": schema,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
      };
}

class User {
  String id;
  String email;
  List<String> roles;
  String? firstname;
  String? lastname;
  String? promoCode;

  User({
    required this.id,
    required this.email,
    required this.roles,
    required this.firstname,
    required this.lastname,
    required this.promoCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        firstname: json["firstname"],
        lastname: json["lastname"],
        promoCode: json["promoCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "firstname": firstname,
        "lastname": lastname,
        "promoCode": promoCode,
      };
}
