import 'package:flutter/material.dart';

import 'game_table.dart';

class BoardSelection extends StatefulWidget {
  BoardSelection({Key key}) : super(key: key);

  _BoardSelectionState createState() => _BoardSelectionState();
}

class _BoardSelectionState extends State<BoardSelection> {
  final _sizes = [4, 6, 8];

  int _currentSize;

  _onDropdownChange(int value) {
    setState(() {
      this._currentSize = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 3.0),
            child: DropdownButton<int>(
              items: _sizes.map((int value) {
                return DropdownMenuItem<int>(value: value, child: Text('${value.toString()} x ${value.toString()}'));
              }).toList(),
              value: _currentSize,
              onChanged: (int value) {
                _onDropdownChange(value);
              },
              icon: Icon(Icons.arrow_drop_down, size: 28, color: Colors.indigo),
              hint: Text('Board Sizes'),
            )),
        GameTable(boardSize: _currentSize)
      ],
    );
  }
}
