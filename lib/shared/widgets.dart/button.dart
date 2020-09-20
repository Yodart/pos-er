import 'package:expay/util/ui_scale.dart';
import 'package:flutter/material.dart';

class StandardButton extends StatefulWidget {
  double height;
  double width;
  Color color;
  Color borderColor;
  Color textColor;
  BorderRadiusGeometry borderRadius;
  String text;
  Function onTap;
  bool loading;
  StandardButton(
      {this.height,
      this.width,
      this.color,
      this.borderColor,
      this.textColor,
      this.borderRadius,
      this.text,
      this.loading = false,
      this.onTap});
  @override
  _StandardButtonState createState() => _StandardButtonState();
}

class _StandardButtonState extends State<StandardButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      child: Container(
        height: widget.height ?? UIScale.width(10),
        width: widget.width ?? UIScale.width(35),
        decoration: BoxDecoration(
            color: widget.color ?? Color(0xffAA8B52),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(UIScale.width(2)),
            border: Border.all(color: widget.borderColor ?? Color(0xffAA8B52), width: 2)),
        child: Center(
          child: widget.loading
              ? Container(
                  height: UIScale.width(4),
                  width: UIScale.width(4),
                  child: CircularProgressIndicator(
                      strokeWidth: UIScale.width(0.7),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      )),
                )
              : Text(widget.text ?? 'Confirmar',
                  style: TextStyle(color: widget.textColor ?? Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}
