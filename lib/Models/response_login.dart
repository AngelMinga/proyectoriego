import 'dart:convert';

import 'package:proyectoriego/Models/response_usuario.dart';

class ResponseLogin {
  ResponseLogin({
    this.message,
    this.user,
    this.status,
  });

  String? message;
  User? user;
  bool? status;

  factory ResponseLogin.fromJson(String str) => ResponseLogin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseLogin.fromMap(Map<String, dynamic> json) => ResponseLogin(
    message: json["message"] == null ? null : json["message"],
    user: json["user"] == null ? null : User.fromMap(json["user"]),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toMap() => {
    "message": message == null ? null : message,
    "user": user == null ? null : user!.toMap(),
    "status": status == null ? null : status,
  };
}

class User {
  User({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toMap(),
  };
}

class Data {
  Data({
    this.id,
    this.email,
    this.password,
    this.status,
    this.person,
    this.rol,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? email;
  String? password;
  bool? status;
  Person? person;
  Rol? rol;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["_id"] == null ? null : json["_id"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    status: json["Status"] == null ? null : json["Status"],
    person: json["person"] == null ? null : Person.fromMap(json["person"]),
    rol: json["rol"] == null ? null : Rol.fromMap(json["rol"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id == null ? null : id,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "Status": status == null ? null : status,
    "person": person == null ? null : person!.toMap(),
    "rol": rol == null ? null : rol!.toMap(),
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
  };
}