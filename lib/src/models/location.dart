class Location {
  Location(
      this.type,
      this.coordinates,
      );

  factory Location.fromJSON(Map<String, dynamic> json) {
    return Location(json["type"], json["coordinates"]);
  }
  String type;
  List<double> coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['coordinates'] = coordinates;
    return map;
  }
}