import 'dart:convert';

class HourlyWeatherModel {
  final List<HourlyWeatherListElement>? list;

  HourlyWeatherModel({
    this.list,
  });

  factory HourlyWeatherModel.fromJson(String str) => HourlyWeatherModel.fromMap(json.decode(str));

  factory HourlyWeatherModel.fromMap(Map<String, dynamic> json) => HourlyWeatherModel(
        list: json["list"] == null
            ? []
            : List<HourlyWeatherListElement>.from(json["list"]!.map((x) => HourlyWeatherListElement.fromMap(x))),
      );
}

class HourlyWeatherListElement {
  final int? dt;
  final HourlyWeatherMain? main;
  final List<HourlyWeatherDescription>? weather;
  final HourlyWeatherCloudy? clouds;
  final HourlyWeatherWind? wind;
  final int? visibility;
  final double? pop;
  final HourlyWeatherSys? sys;
  final DateTime? dtTxt;
  final HourlyWeatherRain? rain;

  HourlyWeatherListElement({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
    this.rain,
  });

  factory HourlyWeatherListElement.fromJson(String str) => HourlyWeatherListElement.fromMap(json.decode(str));

  factory HourlyWeatherListElement.fromMap(Map<String, dynamic> json) => HourlyWeatherListElement(
        dt: json["dt"],
        main: json["main"] == null ? null : HourlyWeatherMain.fromMap(json["main"]),
        weather: json["weather"] == null
            ? []
            : List<HourlyWeatherDescription>.from(json["weather"]!.map((x) => HourlyWeatherDescription.fromMap(x))),
        clouds: json["clouds"] == null ? null : HourlyWeatherCloudy.fromMap(json["clouds"]),
        wind: json["wind"] == null ? null : HourlyWeatherWind.fromMap(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"]?.toDouble(),
        sys: json["sys"] == null ? null : HourlyWeatherSys.fromMap(json["sys"]),
        dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
        rain: json["rain"] == null ? null : HourlyWeatherRain.fromMap(json["rain"]),
      );
}

class HourlyWeatherCloudy {
  final int? all;

  HourlyWeatherCloudy({
    this.all,
  });

  factory HourlyWeatherCloudy.fromJson(String str) => HourlyWeatherCloudy.fromMap(json.decode(str));

  factory HourlyWeatherCloudy.fromMap(Map<String, dynamic> json) => HourlyWeatherCloudy(
        all: json["all"],
      );
}

class HourlyWeatherMain {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final double? tempKf;

  HourlyWeatherMain({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory HourlyWeatherMain.fromJson(String str) => HourlyWeatherMain.fromMap(json.decode(str));

  factory HourlyWeatherMain.fromMap(Map<String, dynamic> json) => HourlyWeatherMain(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
      );
}

class HourlyWeatherRain {
  final double? the3H;

  HourlyWeatherRain({
    this.the3H,
  });

  factory HourlyWeatherRain.fromJson(String str) => HourlyWeatherRain.fromMap(json.decode(str));

  factory HourlyWeatherRain.fromMap(Map<String, dynamic> json) => HourlyWeatherRain(
        the3H: json["3h"]?.toDouble(),
      );
}

class HourlyWeatherSys {
  final String? pod;

  HourlyWeatherSys({
    this.pod,
  });

  factory HourlyWeatherSys.fromJson(String str) => HourlyWeatherSys.fromMap(json.decode(str));

  factory HourlyWeatherSys.fromMap(Map<String, dynamic> json) => HourlyWeatherSys(
        pod: json["pod"],
      );
}

class HourlyWeatherDescription {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  HourlyWeatherDescription({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory HourlyWeatherDescription.fromJson(String str) => HourlyWeatherDescription.fromMap(json.decode(str));

  factory HourlyWeatherDescription.fromMap(Map<String, dynamic> json) => HourlyWeatherDescription(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
}

class HourlyWeatherWind {
  final double? speed;
  final int? deg;
  final double? gust;

  HourlyWeatherWind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory HourlyWeatherWind.fromJson(String str) => HourlyWeatherWind.fromMap(json.decode(str));

  factory HourlyWeatherWind.fromMap(Map<String, dynamic> json) => HourlyWeatherWind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
      );
}
