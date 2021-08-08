import 'package:flutter/material.dart';

class gameButtonWidget extends StatefulWidget {
  var borderStyle;
  Function update;
  Function win;
  int index;
  String text = "";

  gameButtonWidget(
      this.index, this.text, this.update, this.win, this.borderStyle);

  @override
  _gameButtonWidgetState createState() => _gameButtonWidgetState();
}

class _gameButtonWidgetState extends State<gameButtonWidget> {
  var xColor = Color.fromRGBO(181, 7, 107, 1);
  var oColor = Color.fromRGBO(241, 235, 187, 1);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            width: 100,
            decoration: widget.borderStyle,
            child: MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  widget.update(widget.index);
                  widget.win();
                },
                child: Text(
                  widget.text,
                  style: TextStyle(
                      color: widget.text == "X" ? xColor : oColor,
                      fontSize: 50),
                ))));
  }
}
