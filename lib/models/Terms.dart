class Terms {
  Terms({
    required this.season,
  });
  late final String season;

  Terms.fromJson(Map<String, dynamic> json) {
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['season'] = season;
    return _data;
  }
}
