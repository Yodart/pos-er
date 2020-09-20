import 'package:expay/models/pdv.dart';
import 'package:expay/models/user.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
part 'event.g.dart';

@HiveType(typeId: 0)
class Event extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String nameShort;
  @HiveField(3)
  DateTime startDate;
  @HiveField(4)
  DateTime endDate;
  @HiveField(5)
  List<PDV> pdvs;
  @HiveField(6)
  PDV selectedPDV;
  @HiveField(7)
  bool open;
  @HiveField(8)
  User user;
  Event(
      {@required this.id,
      @required this.name,
      @required this.nameShort,
      @required this.startDate,
      @required this.endDate,
      @required this.pdvs,
      this.user,
      this.selectedPDV,
      this.open = false});

  static Event fake() {
    return Event(
        id: 123,
        name: 'BALADA DO GUSTAVO LIMA',
        nameShort: 'BALADA MIX',
        startDate: DateTime(2020, 03, 12),
        endDate: DateTime(2020, 12, 31),
        pdvs: [
          PDV(id: 124, name: 'CAIXA 1'),
          PDV(id: 250, name: 'BAR 12'),
          PDV(id: 2509, name: 'CAIXA 15'),
          PDV(id: 2093, name: 'PISTA 1'),
          PDV(id: 552, name: 'CAIXA 1'),
          PDV.fake()
        ],
        selectedPDV: PDV.fake(),
        user: User.fake());
  }
}
