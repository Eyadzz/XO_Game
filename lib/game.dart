import 'package:flutter/material.dart';
import 'package:xo/gameButtonWidget.dart';

class game extends StatefulWidget {

  @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {

  List<String> XOGrid = ['', '', '', '', '', '', '', '', '',];
  bool xTurn=true;
  int filledBoxes = 0;
  String winner = "";
  var borderBottomRight = BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey,width: 1,),right: BorderSide(color: Colors.grey,width: 1,)));
  var borderRight= BoxDecoration(border: Border(right: BorderSide(color: Colors.grey,width: 1,)));
  var borderBottom = BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey,width: 1,)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 23, 23, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(23, 23, 23, 1),
        title: Row(mainAxisAlignment:MainAxisAlignment.center,children:[ SizedBox(width: 30,), Text("XO GAME", style: TextStyle(fontSize: 25),),],),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, size: 30,),
            onPressed: () {clear();},
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70,),
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      gameButtonWidget(0,XOGrid.elementAt(0),updateTable,winState,borderBottomRight),
                      gameButtonWidget(3,XOGrid.elementAt(3),updateTable,winState,borderBottomRight),
                      gameButtonWidget(6,XOGrid.elementAt(6),updateTable,winState,borderRight),
                    ],
                  ),
                  Column(
                    children: [
                      gameButtonWidget(1,XOGrid.elementAt(1),updateTable,winState,borderBottomRight),
                      gameButtonWidget(4,XOGrid.elementAt(4),updateTable,winState,borderBottomRight),
                      gameButtonWidget(7,XOGrid.elementAt(7),updateTable,winState,borderRight),
                    ],
                  ),
                  Column(
                    children: [
                      gameButtonWidget(2,XOGrid.elementAt(2),updateTable,winState,borderBottom),
                      gameButtonWidget(5,XOGrid.elementAt(5),updateTable,winState,borderBottom),
                      gameButtonWidget(8,XOGrid.elementAt(8),updateTable,winState,null),
                    ],
                  ),
                ],
              )
          ),
          SizedBox(height: 50,),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: Text(winner, style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              )
          ),
        ],
      ),
    );
  }

  void updateTable(int index) {
    if(XOGrid.elementAt(index).isEmpty)
      {
        String element = xTurn ? "X": "O";
        xTurn=!xTurn;
        setState(() {
          XOGrid[index]=element;
          filledBoxes++;
        });
      }
    print(filledBoxes);
  }

  void winState() {
      setState(() {
        if (XOGrid[0] == XOGrid[1] && XOGrid[0] == XOGrid[2] && XOGrid[0] != '') {
          winner = "WINNER IS : "+ XOGrid[0] ;
        }
        else if (XOGrid[3] == XOGrid[4] && XOGrid[3] == XOGrid[5] && XOGrid[3] != '') {
          winner = "WINNER IS : "+ XOGrid[3] ;
        }
        else if (XOGrid[6] == XOGrid[7] && XOGrid[6] == XOGrid[8] && XOGrid[6] != '') {
          winner = "WINNER IS : "+ XOGrid[6];
        }
        else if (XOGrid[0] == XOGrid[3] && XOGrid[0] == XOGrid[6] && XOGrid[0] != '') {
          winner = "WINNER IS : "+ XOGrid[0];
        }
        else if (XOGrid[1] == XOGrid[4] && XOGrid[1] == XOGrid[7] && XOGrid[1] != '') {
          winner = "WINNER IS : "+ XOGrid[1];
        }
        else if (XOGrid[2] == XOGrid[5] && XOGrid[2] == XOGrid[8] && XOGrid[2] != '') {
          winner = "WINNER IS : "+ XOGrid[2];
        }
        else if (XOGrid[0] == XOGrid[4] && XOGrid[0] == XOGrid[8] && XOGrid[0] != '') {
          winner = "WINNER IS : "+ XOGrid[0];
        }
        else if (XOGrid[2] == XOGrid[4] && XOGrid[2] == XOGrid[6] && XOGrid[2] != '') {
          winner = "WINNER IS : "+ XOGrid[2];
        }
        else if (filledBoxes == 9) {
          winner = "DRAW";
        }
      });
  }

  void clear() {
    setState(() {
      for (int i=0; i<XOGrid.length; i++)
      {
        XOGrid[i]="";
      }
      winner="";
      filledBoxes=0;
    });
  }
}
