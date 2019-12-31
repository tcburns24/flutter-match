import 'dart:math';

import 'package:flutter/material.dart';

import './match_card.dart';

class TableRow extends StatelessWidget {
  TableRow({Key key, this.items, this.randomSection}) : super(key: key);

  final int items;
  final List<int> randomSection;

  List<Widget> _generateRow(BuildContext context) {
    return List<Widget>.generate(items, (int index) {
      return MatchCard(
        text: randomSection[index].toString(),
        cardSize: MediaQuery.of(context).size.width / (items + 1),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateRow(context),
    ));
  }
}

class GameTable extends StatefulWidget {
  GameTable({Key key, this.boardSize}) : super(key: key);

  final int boardSize;

  @override
  _GameTableState createState() => _GameTableState();
}

class _GameTableState extends State<GameTable> {
  List<int> _randomNums = [];

  List _shuffle(List items) {
    var random = new Random();

    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  void _generateRandomNums() {
    List<int> myNums = [];
    if (widget.boardSize != null) {
      for (var i = 0; i < (widget.boardSize * widget.boardSize) / 2; i++) {
        myNums.add(Random().nextInt(99));
      }
      myNums = myNums.expand((i) => [i, i]).toList();
      _shuffle(myNums);
      print('✅ AFTERshuffle, after double: myNums = $myNums');
    }
    setState(() {
      _randomNums = myNums;
    });
    print('✅✅ _randomNums = $_randomNums');
  }

  List<Widget> _generateBoard() {
    return List<Widget>.generate(widget.boardSize, (int index) {
      return TableRow(
        items: widget.boardSize,
        randomSection: _randomNums.sublist((index * widget.boardSize), (index * widget.boardSize) + widget.boardSize),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _generateRandomNums();
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
        padding: EdgeInsets.all(3.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.boardSize != null
                ? _generateBoard()
                : <Widget>[
                    Icon(Icons.grid_on, color: Colors.indigo, size: 28.0),
                    Text('Choose your board size', style: TextStyle(fontSize: 18.0, fontFamily: "avenir"))
                  ]));
  }
}
