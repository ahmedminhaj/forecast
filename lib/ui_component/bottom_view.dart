import 'package:flutter/material.dart';
import 'package:forcast/custom_component/neu_card.dart';
import 'package:forcast/model/forecast_model.dart';
import 'package:forcast/ui_component/forecast_card.dart';

Widget bottomView(AsyncSnapshot<ForecastModel> snapshot, BuildContext context) {
  var forecast = snapshot.data.list;
  return Container(
    height: 180,
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(width: 0),
      itemCount: forecast.length,
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15),),
        child: NeuCard(
          width: MediaQuery.of(context).size.width/2.8,
          height: 170.0,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          tailWidget: forecastCard(snapshot, index),
        ),
      ),
    ),
  );
}
