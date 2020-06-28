import 'package:flutter/material.dart';
import 'package:forcast/custom_component/neu_card.dart';
import 'package:forcast/model/forecast_model.dart';
import 'package:forcast/model/network/network.dart';
import 'package:forcast/ui_component/bottom_view.dart';
import 'package:forcast/ui_component/forecast_details.dart';
import 'package:forcast/ui_component/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<ForecastModel> forecastObject;
  String _cityName = "Chittagong";

  @override
  void initState() {
    super.initState();
    forecastObject = getWeather();
  }

  Future<ForecastModel> getWeather(){
    return Network().getWeatherForcast(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3f8ff),
      body: ListView(
        children: <Widget>[
          searchBarView(),
          Container(
            child: FutureBuilder<ForecastModel>(
              future: forecastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<ForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      forecastDetails(snapshot),
                      bottomView(snapshot, context),
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBarView(){
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
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            forecastObject = getWeather();
          });
        },
      ),
    );
  }
}
