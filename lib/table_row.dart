import 'package:flutter/material.dart';

import './match_card.dart';

class TableRow extends StatelessWidget {
  TableRow({Key key, this.items}) : super(key: key);

  final int items;

  List<Widget> _generateRow() {
    return List<Widget>.generate(items, (int index) {
      return MatchCard(text: (index * 10).toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _generateRow(),
    );
  }
}

class GameTable extends StatelessWidget {
  GameTable({Key key, this.boardSize}) : super(key: key);

  final int boardSize;

  List<Widget> _generateBoard() {
    return List<Widget>.generate(boardSize, (int index) {
      return TableRow(items: boardSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 1.0, bottom: 1.0)),
        TableRow(items: boardSize),
        Padding(padding: EdgeInsets.only(top: 1.0, bottom: 1.0))
      ],
    );
  }
}
