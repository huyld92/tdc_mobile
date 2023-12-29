import 'dart:ffi';

import 'package:tdc_mobile/core/enums/enum_gender.dart';

class AccountModel {
  String accountID;
  String phone;
  String password;
  String fullName;
  String gender;
  DateTime birthday;
  double balance;
  bool isActive;
  String roleName;

  AccountModel(
      {required this.accountID,
      required this.phone,
      required this.password,
      required this.fullName,
      required this.gender,
      required this.birthday,
      required this.balance,
      required this.isActive,
      required this.roleName});

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    print('json: ${json.toString()}');
    return AccountModel(
        accountID: json["id"] ?? "1",
        phone: json["phone"] ?? "0908",
        password: json["password"] ?? "aa",
        fullName: json["fullName"] ?? "Name",
        gender: json["gender"] ?? EGender.Other,
        birthday: DateTime.parse(json["birthday"]) ?? DateTime.now(),
        balance: json["balance"] ?? 0.0,
        isActive: json["isActive"] ?? true,
        roleName: json["role"]["roleName"]);
  }

  static List<AccountModel> listFromJson(list) =>
      List<AccountModel>.from(list.map((x) => AccountModel.fromJson(x)));

  factory AccountModel.empty() {
    return AccountModel(
        accountID: "accountID",
        phone: "phone",
        password: "password",
        fullName: "fullName",
        gender: "gender",
        birthday: DateTime.now(),
        balance: 0.0,
        isActive: false,
        roleName: "roleName");
  }

  @override
  String toString() {
    return 'AccountModel{accountID: $accountID, phone: $phone, password: $password, fullName: $fullName, gender: $gender, birthday: $birthday, balance: $balance, isActive: $isActive, roleName: $roleName}';
  }
}
