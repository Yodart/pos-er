import 'package:expay/models/event.dart';
import 'package:expay/screens/home/home.dart';
import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DownloaderStepToken {
  String title;
  String state;
  DownloaderStepToken(this.title, this.state);
}

class DownloaderStep extends StatefulWidget {
  DownloaderStepToken token;
  DownloaderStep({@required this.token});
  @override
  _DownloaderStepState createState() => _DownloaderStepState();
}

class _DownloaderStepState extends State<DownloaderStep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIScale.width(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: UIScale.width(7),
                width: UIScale.width(7),
                child: Center(
                  child: widget.token.state == 'done'
                      ? Icon(Icons.check, color: Colors.green, size: 25)
                      : widget.token.state == 'downloading'
                          ? Container(
                              height: UIScale.width(3),
                              width: UIScale.width(3),
                              child: CircularProgressIndicator(
                                  strokeWidth: UIScale.width(0.5),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  )),
                            )
                          : Container(),
                ),
              ),
              SizedBox(width: UIScale.width(2)),
              Text(widget.token.title, style: TextStyle(color: Colors.white, fontSize: 17)),
            ],
          ),
          SizedBox(height: 10),
          Container(color: Color(0xffAA8B52), width: UIScale.width(80), height: 2),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class AllocateDownloader extends StatefulWidget {
  Event event;
  AllocateDownloader({@required this.event});
  @override
  _AllocateDownloaderState createState() => _AllocateDownloaderState();
}

class _AllocateDownloaderState extends State<AllocateDownloader> {
  bool downloadTriggered = false;
  List<DownloaderStepToken> tokens = [
    DownloaderStepToken('Preparando-se para sincronização', null),
    DownloaderStepToken('Tipo de pagamento', null),
    DownloaderStepToken('Métodos de pagamento', null),
    DownloaderStepToken('Locais', null),
    DownloaderStepToken('Clientes', null),
    DownloaderStepToken('Categoria de produtos', null),
    DownloaderStepToken('Medidas de produto', null),
    DownloaderStepToken('Menu', null),
    DownloaderStepToken('Produtos', null),
    DownloaderStepToken('Menu de Produtos', null),
  ];
  Future<void> download(BuildContext context) {
    setState(() => downloadTriggered = true);
    for (int i = 0; i < tokens.length; i++) {
      Future.delayed(Duration(milliseconds: 400 * (i + 1)), () {
        setState(() => tokens[i].state = 'downloading');
        Future.delayed(Duration(milliseconds: 400 * (i + 1)), () {
          setState(() => tokens[i].state = 'done');
        });
      });
    }
    Future.delayed(Duration(milliseconds: 800 * (tokens.length + 1)), () async {
      Box<Event> box = await Hive.openBox<Event>('event');
      Event current = box.getAt(0);
      current.id = widget.event.id;
      current.name = widget.event.name;
      current.nameShort = widget.event.nameShort;
      current.startDate = widget.event.startDate;
      current.endDate = widget.event.endDate;
      current.pdvs = widget.event.pdvs;
      current.selectedPDV = widget.event.selectedPDV;
      current.open = true;
      current.user = widget.event.user;
      current.save();
      Navigator.of(context).popUntil(ModalRoute.withName("/home"));
    });
  }

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    if (downloadTriggered == false) download(context);
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
              Text('Download do evento', style: TextStyle(color: Colors.white, fontSize: 22)),
              SizedBox(height: UIScale.width(5)),
              for (int i = 0; i < tokens.length; i++) DownloaderStep(token: tokens[i]),
              SizedBox(height: UIScale.width(4)),
            ],
          ),
        ),
      ),
    );
  }
}
