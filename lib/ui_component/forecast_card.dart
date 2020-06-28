import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forcast/model/forecast_model.dart';
import 'package:forcast/model/utils/forecast_utils.dart';
import 'package:forcast/model/utils/weather_icons.dart';

Widget forecastCard(AsyncSnapshot<ForecastModel> snapshot, int index) {
  var forecast = snapshot.data.list;
  var datetime = Util.getFormattedDatetime(
      DateTime.fromMillisecondsSinceEpoch(forecast[index].dt * 1000));
  var weekDay = datetime.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
        width: 60,
        height: 50,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: -2.0,
              top: -2.0,
              child: getWeatherIcon(
                  forecast[index].weather[0].main, Colors.white, 44),
            ),
            Positioned(
              left: 3.0,
              top: 4.0,
              child: getWeatherIcon(forecast[index].weather[0].main,
                  Color(0xff000000).withOpacity(0.16), 40),
            ),
            getWeatherIcon(
                forecast[index].weather[0].main, Color(0xffe3f8ff), 40),
          ],
        ),
      ),
      Text(
        "$weekDay",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(FontAwesomeIcons.temperatureLow, size: 18,),
              Text(
                "${forecast[index].temp.min.toStringAsFixed(0)}°F",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(FontAwesomeIcons.temperatureHigh, size: 18,),
              Text(
                "${forecast[index].temp.max.toStringAsFixed(0)}°F",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
