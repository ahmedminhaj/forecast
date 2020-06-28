import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon(String weatherDescription, Color color, double size) {
  switch (weatherDescription) {
    case "Clear":
      {
        return Icon(
          FontAwesomeIcons.cloudSun,
          color: color,
          size: size,
        );
      }
      break;
    case "Cloud":
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }
      break;
    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudShowersHeavy,
          color: color,
          size: size,
        );
      }
      break;
    case "Snow":
      {
        return Icon(
          FontAwesomeIcons.snowflake,
          color: color,
          size: size,
        );
      }
      break;
    default:
      {
        return Icon(
          FontAwesomeIcons.cloudSun,
          color: color,
          size: size,
        );
      }
      break;
  }
}
