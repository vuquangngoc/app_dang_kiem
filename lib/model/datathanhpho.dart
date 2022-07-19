// class City {
//   int cityId;
//   String name;
//
//   City({required this.cityId, required this.name});
//
//   factory City.fromJson(Map<String, dynamic> json) {
//     return City(
//       cityId: json['cityId'],
//       name: json['name'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cityId'] = cityId;
//     data['name'] = name;
//     return data;
//   }
// }


import 'package:test11/model/thanhpho.dart';

class City {
  int code;
  int  focussed;
  final List<CityData> city;

  City({required this.code, required this.focussed,required this.city});

  factory City.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['city'] as List;
    List imagesList = list.map((i) => CityData.fromJson(i)).toList();
    return City(
        code: parsedJson['code'],
        focussed: parsedJson['focussed'],
        city:parsedJson[imagesList]
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['focussed'] = focussed;
    data['city']=city;
    return data;
  }
}