import 'package:flutter/material.dart';

class MatchCard extends StatefulWidget {
  MatchCard({Key key}) : super(key: key);

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
