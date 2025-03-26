class LatLangModel {
  dynamic lat;
  dynamic lang;

  LatLangModel({
    this.lat,
    this.lang,
  });

  LatLangModel.fromJson(Map<String, dynamic> json) {
    lat = json['branch_lat'].toString();
    lang = json['branch_long'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lang'] = lang;
    return data;
  }
}
