import 'package:expay/models/event.dart';
import 'package:expay/models/user.dart';
import 'package:expay/screens/alocate/downloader.dart';
import 'package:expay/shared/widgets.dart/button.dart';
import 'package:expay/shared/widgets.dart/inputter.dart';
import 'package:expay/util/ui_icon.dart';
import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AuthCheck extends StatefulWidget {
  User user;
  Widget route;
  AuthCheck({@required this.user, @required this.route});
  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool loading = false;
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login(BuildContext context, {String login, String password}) {
    setState(() => loading = true);
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        if (login == widget.user.login && password == widget.user.password) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => widget.route));
        }
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xff232B2D),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: UIScale.width(10)),
          child: Column(
            children: <Widget>[
              SizedBox(height: UIScale.width(10)),
              Container(
                height: UIScale.width(20),
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
              Inputter(
                prefixIcon: Icon(Icons.person, color: Colors.white),
                labelText: 'Login',
                controller: loginController,
              ),
              SizedBox(height: UIScale.width(7)),
              Inputter(
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                labelText: 'Senha',
                controller: passwordController,
              ),
              SizedBox(height: UIScale.width(2)),
              Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    UIIcon.contactless(size: UIScale.width(10)),
                    SizedBox(width: UIScale.width(1)),
                    Text('ou aproxime seu cartão.', style: TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(height: UIScale.width(4)),
              Align(
                  alignment: Alignment.centerRight,
                  child: StandardButton(
                    text: 'Entrar',
                    loading: loading,
                    onTap: () => login(context, login: loginController.text, password: passwordController.text),
                  )),
              SizedBox(height: UIScale.width(4)),
            ],
          ),
        ),
      ),
    );
  }
}
