import 'package:flutter/material.dart';

class MatchCard extends StatefulWidget {
  MatchCard({Key key, this.text, this.cardSize}) : super(key: key);

  final String text;
  final double cardSize;

  @override
  _MatchCardState createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  bool _revealed = false;
  bool _matched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: widget.cardSize,
        width: widget.cardSize,
//        padding: EdgeInsets.all(2.0),
        margin: EdgeInsets.only(top: 1.0, left: 1.0),
        child: Center(
            child: Text(
          _revealed == true ? widget.text : '',
          style: TextStyle(
            fontFamily: "avenir",
            fontSize: 26.0,
          ),
          textAlign: TextAlign.center,
        )),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _revealed == true ? [Colors.grey, Colors.white] : [Colors.indigo, Colors.indigoAccent]),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.black45)),
      ),
      onTap: () {
        setState(() {
          _revealed = true;
        });
      },
    );
  }
}
