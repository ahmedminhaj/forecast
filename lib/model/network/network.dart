import 'dart:convert';

import 'package:forcast/model/forecast_model.dart';
import 'package:forcast/model/utils/forecast_utils.dart';
import 'package:http/http.dart';

class Network{
  Future<ForecastModel> getWeatherForcast({String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+"&appid="+Util.appID+"&units=imperial";

    final response = await get(Uri.encodeFull(finalUrl));
    print("URI ${Uri.encodeFull(finalUrl)}");

    if(response.statusCode == 200){
      print("Weather data: ${response.body}");
      return ForecastModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Error getting weather forcast");
    }
  }
}