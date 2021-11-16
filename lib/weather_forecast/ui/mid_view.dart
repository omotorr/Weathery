import 'package:flutter/material.dart';
import 'package:flutter_weather_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter_weather_app/weather_forecast/util/convert_icon.dart';
import 'package:flutter_weather_app/weather_forecast/util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MidView extends StatelessWidget {

  final AsyncSnapshot<WeatherForecastModel> snapshot;
  const MidView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var forecastList = snapshot.data!.list;
    var city = snapshot.data!.city!.name;
    var country = snapshot.data!.city!.country;
    var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! *1000);

    return Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("$city,$country",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),),
              Text('${Util.getForemattedDate(formattedDate)}'),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: getWeatherIcon(weatherDecription: forecastList[0].weather![0].main,
                    color: Colors.pinkAccent,size: 198),
              ),
              // Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pink,),
              // Icon(Icons.wb_sunny, size: 200,),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${forecastList[0].temp!.day.toStringAsFixed(0)}°F",
                      style: new TextStyle(
                          fontSize: 34
                      ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${forecastList[0].weather![0].description.toUpperCase()}"),
                    ),


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text("${forecastList[0].speed!.toStringAsFixed(1)} mi/h"),
                              Icon(FontAwesomeIcons.wind ,size: 20,)
                              // Icon(Icons.arrow_forward, size: 17, color: Colors.brown,)
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("${forecastList[0].humidity!.toStringAsFixed(0)} %",),
                          Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20,color: Colors.brown,),
                          // Icon(Icons.hot_tub,size: 20,color: Colors.brown,)
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text("${forecastList[0].temp!.max.toStringAsFixed(0)} °F",),
                          Icon(FontAwesomeIcons.temperatureHigh ,size: 20,)
                          // Icon(Icons.wb_sunny,size: 20,color: Colors.brown,),
                        ],
                      ),)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
var forecastList = snapshot.data!.list;
var city = snapshot.data!.city!.name;
var country = snapshot.data!.city!.country;
var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! *1000);
var forecast = forecastList[0];
Container midView = Container(
  child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("$city,$country",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black87,
        ),),
        Text('${Util.getForemattedDate(formattedDate)}'),

        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWeatherIcon(weatherDecription: forecastList[0].weather![0].main,
          color: Colors.pinkAccent,size: 198),
        ),
        // Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pink,),
        // Icon(Icons.wb_sunny, size: 200,),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${forecastList[0].temp!.day.toStringAsFixed(0)}°F",
              style: new TextStyle(
                fontSize: 34
              ),),
              Text("${forecastList[0].weather![0].description.toUpperCase()}"),


            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text("${forecastList[0].speed!.toStringAsFixed(1)} mi/h"),
                        Icon(FontAwesomeIcons.wind ,size: 20,)
                        // Icon(Icons.arrow_forward, size: 17, color: Colors.brown,)
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("${forecastList[0].humidity!.toStringAsFixed(0)} %",),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20,color: Colors.brown,),
                    // Icon(Icons.hot_tub,size: 20,color: Colors.brown,)
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Text("${forecastList[0].temp!.max.toStringAsFixed(0)} °F",),
                  Icon(FontAwesomeIcons.temperatureHigh ,size: 20,)
                  // Icon(Icons.wb_sunny,size: 20,color: Colors.brown,),
                ],
              ),)
            ],
          ),
        )
      ],
    ),
  )
);
return midView;
}