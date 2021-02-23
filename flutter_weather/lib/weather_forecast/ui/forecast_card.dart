import 'package:flutter/material.dart';
import 'package:flutter_weather/weather_forecast/util/convert_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../util/forecast_util.dart';
import '../model/weather_forecast_model.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date =
      new DateTime.fromMicrosecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
              weatherDescription: forecastList[index].weather[0].main,
              color: Colors.pinkAccent,
              size: 45,
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastList[index].temp.min.toStringAsFixed(0)} °F"),
                  ),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 17,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${forecastList[index].temp.max.toStringAsFixed(0)} °F"),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleUp,
                      color: Colors.white,
                      size: 17,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        " Hum:${forecastList[index].humidity.toStringAsFixed(0)} %"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Wind:${forecastList[index].speed.toStringAsFixed(0)} mi/h"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
