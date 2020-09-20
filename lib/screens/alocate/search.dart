import 'package:expay/models/event.dart';
import 'package:expay/screens/alocate/select_pdv.dart';
import 'package:expay/shared/widgets.dart/button.dart';
import 'package:expay/shared/widgets.dart/inputter.dart';
import 'package:expay/util/ui_icon.dart';
import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';

class AllocateSearch extends StatefulWidget {
  @override
  _AllocateSearchState createState() => _AllocateSearchState();
}

class _AllocateSearchState extends State<AllocateSearch> {
  Event selectedEvent;
  bool searching = false;
  TextEditingController inputController = TextEditingController();
  Future<void> search(String input) {
    setState(() => searching = true);
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        selectedEvent = input == '12345' ? Event.fake() : null;
        searching = false;
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
              Inputter(
                prefixIcon: Icon(Icons.vpn_key, color: Colors.white),
                labelText: 'Chave do evento.',
                controller: inputController,
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
              SizedBox(height: UIScale.width(2)),
              if (selectedEvent != null)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AllocateSelectPDV(event: selectedEvent)));
                  },
                  child: Container(
                    width: UIScale.width(80),
                    height: UIScale.width(25),
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(UIScale.width(3))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(selectedEvent.name,
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(
                              '${selectedEvent.startDate.day}/${selectedEvent.startDate.month}/${selectedEvent.startDate.year}  -  ${selectedEvent.endDate.day}/${selectedEvent.endDate.month}/${selectedEvent.endDate.year}',
                              style: TextStyle(color: Colors.black, fontSize: 16)),
                          Text(selectedEvent.nameShort, style: TextStyle(color: Colors.black, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(height: UIScale.width(4)),
              Align(
                  alignment: Alignment.centerRight,
                  child: StandardButton(
                    text: 'Confirmar',
                    loading: searching,
                    onTap: () => search(inputController.text),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
