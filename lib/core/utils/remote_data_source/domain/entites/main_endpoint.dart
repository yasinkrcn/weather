enum MainEndpoints {
  weather,
  forecast,
}

extension MainEndPointExtension on MainEndpoints {
  String get path {
    switch (this) {
      case MainEndpoints.weather:
        return "data/2.5/weather";
      case MainEndpoints.forecast:
        return "data/2.5/forecast";
    }
  }
}
