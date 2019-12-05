import 'package:flutter/material.dart';

import './match_card.dart';

class TableRow extends StatelessWidget {
  TableRow({Key key, this.items}) : super(key: key);

  final int items;

  List<Widget> _generateRow(BuildContext context) {
    return List<Widget>.generate(items, (int index) {
      return MatchCard(
        text: (index.floor() * 10).toString(),
        cardSize: MediaQuery.of(context).size.width / (items + 1),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateRow(context),
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
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
        padding: EdgeInsets.all(3.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: boardSize != null
                ? _generateBoard()
                : <Widget>[
                    Icon(Icons.grid_on, color: Colors.indigo, size: 28.0),
                    Text('Choose your board size', style: TextStyle(fontSize: 18.0, fontFamily: "avenir"))
                  ]));
  }
}
