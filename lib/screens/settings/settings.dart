import 'package:expay/models/event.dart';
import 'package:expay/models/user.dart';
import 'package:expay/screens/alocate/search.dart';
import 'package:expay/screens/auth_check/auth_check.dart';
import 'package:expay/shared/widgets.dart/button.dart';
import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xff232B2D),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: UIScale.width(10)),
          child: ListView(
            children: <Widget>[
              SizedBox(height: UIScale.width(6)),
              Container(
                height: UIScale.width(10),
                width: UIScale.width(80),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  // image: DecorationImage(
                  //   image: AssetImage('assets/images/logo_two.png'),
                  //   fit: BoxFit.contain,
                  // ),
                ),
              ),
              SizedBox(height: UIScale.width(5)),
              StandardButton(
                width: UIScale.width(80),
                text: 'Alocar',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthCheck(
                              user: User.fake(),
                              route: AllocateSearch(),
                            ))),
              ),
              SizedBox(height: UIScale.width(4)),
              StandardButton(width: UIScale.width(80), text: 'Atualizar', onTap: () {}),
              SizedBox(height: UIScale.width(4)),
              StandardButton(width: UIScale.width(80), text: 'Cancelamentos', onTap: () {}),
              SizedBox(height: UIScale.width(4)),
              StandardButton(width: UIScale.width(80), text: 'Cortesias', onTap: () {}),
              SizedBox(height: UIScale.width(4)),
              StandardButton(width: UIScale.width(80), text: 'Financeiro', onTap: () {}),
              SizedBox(height: UIScale.width(4)),
              StandardButton(width: UIScale.width(80), text: 'Menu técnico', onTap: () {}),
              SizedBox(height: UIScale.width(4)),
              StandardButton(width: UIScale.width(80), text: 'Relatórios', onTap: () {}),
              SizedBox(height: UIScale.width(4)),
              StandardButton(width: UIScale.width(80), text: 'Reimpressão', onTap: () {}),
              SizedBox(height: UIScale.width(5)),
            ],
          ),
        ),
      ),
    );
  }
}
