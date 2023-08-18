class AssetPaths {
  static final AssetPaths _instance = AssetPaths._init();
  AssetPaths._init();

  factory AssetPaths() {
    return _instance;
  }

  String _toSVG(String name) => 'assets/svg/$name.svg';
  String _toPNG(String name) => 'assets/png/$name.png';
  String _toJPEG(String name) => 'assets/jpeg/$name.jpeg';
  String _toJSON(String name) => 'assets/json/$name.json';
  String _toGIF(String name) => 'assets/gif/$name.gif';

  //*SVG
  String get humidity => _toSVG("humidity");
  String get sunrise => _toSVG("sunrise");
  String get sunset => _toSVG("sunset");
  String get windy => _toSVG("windy");
  String get home => _toSVG("home");
  String get search => _toSVG("search");
  String get settings => _toSVG("settings");

  //*PNG

  String get turkeyFlag => _toPNG("turkey");
  String get italyFlag => _toPNG("italy");
  String get spainFlag => _toPNG("spain");
  String get germanyFlag => _toPNG("germany");
  String get franceFlag => _toPNG("france");
  String get unitedStatesFlag => _toPNG("united_states");

  //*JSON
  String get notFound => _toJSON("not_found");
  String get searchSomething => _toJSON("search_something");

  //*GIF
}
