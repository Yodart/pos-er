import 'package:expay/models/event.dart';
import 'package:expay/screens/alocate/select_pdv.dart';
import 'package:expay/screens/settings/settings.dart';
import 'package:expay/shared/widgets.dart/button.dart';
import 'package:expay/shared/widgets.dart/inputter.dart';
import 'package:expay/util/ui_icon.dart';
import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Event event;
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Box<Event> box = await Hive.openBox<Event>('event');
      setState(() => event = box.getAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color(0xff232B2D),
        child: Stack(
          children: <Widget>[
            Padding(
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
                  SizedBox(height: UIScale.width(30)),
                  Align(
                      alignment: Alignment.centerRight,
                      child: StandardButton(
                        width: UIScale.width(80),
                        text: 'Vendas',
                        loading: false,
                      )),
                  SizedBox(height: UIScale.width(40)),
                  if (event != null)
                    Container(
                      width: UIScale.width(80),
                      height: UIScale.width(25),
                      decoration:
                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(UIScale.width(3))),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Icon(Icons.settings, size: 50, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
