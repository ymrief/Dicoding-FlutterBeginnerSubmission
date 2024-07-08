import 'dart:math';
import 'package:flutter/material.dart';
import 'package:submission/pages/third_screen.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  // list of tiles
  final List myTiles = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  final List targetTiles = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  void initState() {
    shuffleUntilRandom();
    super.initState();
  }

  void shuffleUntilRandom() {
    do {
      myTiles.shuffle(Random());
    } while (myTiles.equals(targetTiles));
  }

  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }

      final tile = myTiles.removeAt(oldIndex);

      myTiles.insert(newIndex, tile);

      if (myTiles.equals(targetTiles)) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ThirdScreen();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZERO TO HERO!'),
        titleTextStyle: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
        backgroundColor: Colors.orange
      ),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: ReorderableListView(children: [
              for (final tile in myTiles)
                Card(
                  key: ValueKey(tile),
                  color: Colors.orange[100],
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        tile,
                        style: TextStyle(
                          fontFamily: 'Cinzel',
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )),
                )
            ],
            onReorder: (oldIndex, newIndex) => updateMyTiles(oldIndex, newIndex)
            ),
          ),
          SizedBox(height: 16),
          Card(
            color: Colors.orange[50],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Urutkan angka dari yang terkecil',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.orange[900]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

extension ListEquality on List {
  bool equals(List other) {
    if (this.length != other.length) return false;
    for (int i = 0; i < this.length; i++) {
      if (this[i] != other[i]) return false;
    }
    return true;
  }
}