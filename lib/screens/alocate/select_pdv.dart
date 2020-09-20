import 'package:expay/models/event.dart';
import 'package:expay/screens/alocate/downloader.dart';
import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AllocateSelectPDV extends StatefulWidget {
  Event event;
  AllocateSelectPDV({@required this.event});
  @override
  _AllocateSelectPDVState createState() => _AllocateSelectPDVState();
}

class _AllocateSelectPDVState extends State<AllocateSelectPDV> {
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
              Text('Selecione o ponto de venda', style: TextStyle(color: Colors.white, fontSize: 22)),
              SizedBox(height: UIScale.width(5)),
              for (int i = 0; i < widget.event.pdvs.length; i++)
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AllocateDownloader(event: widget.event..selectedPDV = widget.event.pdvs[i]))),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(left: 20),
                    width: UIScale.width(80),
                    height: UIScale.width(20),
                    decoration:
                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(UIScale.width(4))),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('#${widget.event.pdvs[i].id} - ${widget.event.pdvs[i].name}',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ),
                ),
              SizedBox(height: UIScale.width(4)),
            ],
          ),
        ),
      ),
    );
  }
}
