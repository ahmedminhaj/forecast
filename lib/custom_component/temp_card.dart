import 'package:flutter/material.dart';
import 'package:forcast/custom_component/neu_card.dart';

class TempCard extends StatelessWidget {
  final icon;
  final String text;
  TempCard({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      height: 50,
      width: MediaQuery.of(context).size.width/4.4,
      margin: EdgeInsets.all(6.0),
      padding: EdgeInsets.all(2.0),
      tailWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            size: 20,
            color: Colors.black,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
