// class CityData {
//   int cityId;
//   String name;
//
//   CityData({required this.cityId, required this.name});
//
//   factory CityData.fromJson(Map<String, dynamic> json) {
//     return CityData(
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
class ngaydangkiem {
  int code;
  List<String>  data;

  ngaydangkiem({required this.code, required this.data});

  factory ngaydangkiem.fromJson(Map<String, dynamic> json) {
    return ngaydangkiem(
    code : json['code'],
    data : json['data'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['data'] = this.data;
    return data;
  }
}