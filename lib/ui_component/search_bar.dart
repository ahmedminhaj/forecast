import 'package:flutter/material.dart';
import 'package:forcast/custom_component/neu_card.dart';

class SearchBar extends StatefulWidget {
  final String cityName;

  SearchBar({this.cityName});
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      height: 60.0,
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(8.0),
      borderRadius: 50.0,
      tailWidget: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            hintText: "Enter city name"),
        onSubmitted: (value) {},
      ),
    );
  }
}
