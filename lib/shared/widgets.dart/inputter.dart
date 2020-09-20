import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';

class Inputter extends StatefulWidget {
  Widget prefixIcon;
  String labelText;
  TextEditingController controller;
  Inputter({this.prefixIcon, this.labelText, this.controller});
  @override
  _InputterState createState() => _InputterState();
}

class _InputterState extends State<Inputter> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(color: Colors.white),
      decoration: new InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          prefixIcon: widget.prefixIcon ?? Icon(Icons.vpn_key, color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UIScale.width(2)),
            borderSide: BorderSide(color: Color(0xffAA8B52), width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UIScale.width(2)),
            borderSide: BorderSide(color: Color(0xffAA8B52), width: 2.0),
          ),
          labelText: widget.labelText ?? 'Chave do evento',
          labelStyle: TextStyle(color: Colors.white)),
    );
  }
}
