import 'package:flutter/material.dart';

import './match_card.dart';

class TableRow extends StatelessWidget {
  TableRow({Key key, this.boardSize}) : super(key: key);

  final int boardSize;

  List<Widget> _generateRow() {
    return List<Widget>.generate(boardSize, (int index) {
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
