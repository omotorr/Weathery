import 'package:flutter/material.dart';
import 'package:flutter_weather_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter_weather_app/weather_forecast/util/convert_icon.dart';
import 'package:flutter_weather_app/weather_forecast/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget? forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data!.list;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getForemattedDate(date);
  dayOfWeek = fullDate!.split(",")[0]; //Saturday,dec14,2019.....gets just sat

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDecription: forecastList[index].weather![0].main,
            color: Colors.pinkAccent, size: 45),
          ),
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text("${forecastList[index].temp!.min.toStringAsFixed(0)} °F"),
                ),
                Icon(FontAwesomeIcons.solidArrowAltCircleDown,
                  color: Colors.white,
                  size: 17,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Row(
                children: [
                  Text("${forecastList[index].temp!.max.toStringAsFixed(0)} °F"),
                  Icon(FontAwesomeIcons.solidArrowAltCircleUp,
                    color: Colors.white,
                    size: 17,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text("hum:${forecastList[index].humidity!.toStringAsFixed(0)}%"),
                  Icon(FontAwesomeIcons.solidGrinBeamSweat,
                    color: Colors.white,
                    size: 17,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text("win:${forecastList[index].speed!.toStringAsFixed(1)}mi/h"),
                  Icon(FontAwesomeIcons.solidGrinBeamSweat,
                    color: Colors.white,
                    size: 17,)
                ],
              ),
            ),
          ],


  )
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //
        //   ),
        // )
      ],
      )
    ],
  );


}