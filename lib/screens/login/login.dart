import 'package:expay/models/event.dart';
import 'package:expay/screens/alocate/select_pdv.dart';
import 'package:expay/screens/home/home.dart';
import 'package:expay/shared/widgets.dart/button.dart';
import 'package:expay/shared/widgets.dart/inputter.dart';
import 'package:expay/util/ui_icon.dart';
import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Event event = Event.fake();
  bool loading = false;
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Box<Event> box = await Hive.openBox<Event>('event');
      setState(() => event = box.getAt(0));
    });
  }

  Future<void> login({String login, String password}) async {
    setState(() => loading = true);
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        if (login == '12345' && password == '12345') {
          Navigator.of(context).push(
            MaterialPageRoute(settings: RouteSettings(name: "/home"), builder: (context) => Home()),
          );
        }
        loginController.text = '';
        passwordController.text = '';
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
                    onTap: () => login(login: loginController.text, password: passwordController.text),
                  )),
              SizedBox(height: UIScale.width(4)),
              if (event != null)
                Container(
                  width: UIScale.width(80),
                  height: UIScale.width(25),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(UIScale.width(3))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(event.name,
                            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                            '${event.startDate.day}/${event.startDate.month}/${event.startDate.year}  -  ${event.endDate.day}/${event.endDate.month}/${event.endDate.year}',
                            style: TextStyle(color: Colors.black, fontSize: 14)),
                        Text('PDV: ${event.selectedPDV.name}', style: TextStyle(color: Colors.black, fontSize: 14)),
                        Text('OP: ${event.user.code} ${event.user.name}',
                            style: TextStyle(color: Colors.black, fontSize: 14)),
                        SizedBox(height: UIScale.width(1)),
                        Text(event.open ? 'TERMINAL ABERTO' : "TERMINAL FECHADO",
                            style: TextStyle(
                                color: event.open ? Colors.green : Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
