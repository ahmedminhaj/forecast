import 'package:flutter/material.dart';
import 'package:forcast/custom_component/neu_card.dart';
import 'package:forcast/custom_component/temp_card.dart';
import 'package:forcast/model/forecast_model.dart';
import 'package:forcast/model/utils/forecast_utils.dart';
import 'package:forcast/model/utils/weather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget forecastDetails(AsyncSnapshot<ForecastModel> snapshot) {
  var forecast = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var datetime = Util.getFormattedDatetime(
      DateTime.fromMillisecondsSinceEpoch(forecast[0].dt * 1000));
  NeuCard forecastDetails = NeuCard(
    height: 370.0,
    margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
    tailWidget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Column(
            children: <Widget>[
              Text(
                "$city, $country",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              Text(
                "$datetime",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 0.0),
                width: 300,
                height: 170,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: -2.0,
                      top: -3.0,
                      child: getWeatherIcon(
                          forecast[0].weather[0].main, Colors.white, 150),
                    ),
                    Positioned(
                      left: 3.0,
                      top: 4.0,
                      child: getWeatherIcon(forecast[0].weather[0].main,
                          Color(0xff000000).withOpacity(0.16), 150),
                    ),
                    getWeatherIcon(
                        forecast[0].weather[0].main, Color(0xffe3f8ff), 150),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${forecast[0].temp.day.toStringAsFixed(0)}°F",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "${forecast[0].weather[0].description.toUpperCase()}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TempCard(
                      icon: FontAwesomeIcons.wind,
                      text: "${forecast[0].speed.toStringAsFixed(0)} m/h",
                    ),
                    TempCard(
                      icon: FontAwesomeIcons.grinBeamSweat,
                      text: "${forecast[0].humidity.toStringAsFixed(0)}%",
                    ),
                    TempCard(
                      icon: FontAwesomeIcons.temperatureHigh,
                      text: "${forecast[0].temp.max.toStringAsFixed(0)}°F",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  return forecastDetails;
}
