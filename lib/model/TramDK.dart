class TramDk {
  int cityId;
  int stationId;
  String stationName ;
  String address;
  TramDk({ required this.cityId,required this.address, required this.stationName,required this.stationId});

  factory TramDk.fromJson(Map<String, dynamic> json) {
    return TramDk(
      cityId : json['cityId'],
      stationId: json['stationId'],
      stationName : json['stationName'],
      address:  json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['stationId']=this.stationId;
    data['stationName'] = this.stationName;
    data['address'] = this.address;
    return data;
  }
}