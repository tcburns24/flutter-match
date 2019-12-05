import 'package:flutter/material.dart';

class MatchCard extends StatefulWidget {
  MatchCard({Key key, this.text}) : super(key: key);

  final String text;

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
        child: Center(
            child: Text(
          widget.text,
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
                colors: _revealed == true ? [Colors.white70, Colors.white] : [Colors.indigo, Colors.indigoAccent]),
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
