import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 2)
class User {
  @HiveField(0)
  String name;
  @HiveField(1)
  String code;
  @HiveField(2)
  String login;
  @HiveField(3)
  String password;
  User({this.name, this.code, this.login, this.password});
  static User fake() {
    return User(name: 'THIAGO MONTEIRO', code: '002', login: '12345', password: '12345');
  }
}
