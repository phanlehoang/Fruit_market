import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  late String uid;
  late String gmail;
  late String phone;
  late String name;
  late String avatar;
  late String address;

  UserModel(
      {required this.uid,
      required this.gmail,
      required this.phone,
      required this.name,
      required this.avatar,
      required this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json["uid"];
    name = json["name"];
    gmail = json["gmail"];
    avatar = json["avatar"];
    phone = json["phone"];
    address = json["address"];
  }
}
