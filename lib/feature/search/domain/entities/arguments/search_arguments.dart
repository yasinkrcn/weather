class SearchArguments {
  final String? q;
  final String? language;
  final String? units;

  SearchArguments({
    this.q,
    this.language = 'tr',
    this.units = 'metric', // celcius
  });

  Map<String, dynamic> toMap() {
    return {
      'q': q,
      'lang': language,
      'units': units,
    };
  }
}
