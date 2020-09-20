import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'pdv.g.dart';

@HiveType(typeId: 1)
class PDV extends HiveObject {
  @HiveField(0)
  int id;
  String name;

  PDV({@required this.id, @required this.name});

  static PDV fake() {
    return PDV(id: 123, name: 'CAIXA 50');
  }
}
