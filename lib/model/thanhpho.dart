// class dsthanhpho {
//   int code;
//   int focussed;
//   final List<City> city;
//   dsthanhpho({required this.code, required this.focussed, required this.city});
//   factory dsthanhpho.fromJson(Map<String, dynamic> parsedJson) {
//     // var list = json['city'] as List;
//     // print(list.runtimeType);
//     var list = parsedJson['city'] as List;
//     List imagesList = list.map((i) => City.fromJson(i)).toList();
//     // List<City> citylist = list.map((i) => City.fromJson(i)).toList();
//     return dsthanhpho (
//         code : parsedJson['code'],
//         focussed : parsedJson['focussed'],
//         city:parsedJson[imagesList]
//     //     if (json['city'] != null) {
//     //   city = new List<City>();
//     //   json['city'].forEach((v) {
//     //     city.add(new City.fromJson(v));
//     //   });
//     // }
//         );}
//
//   Map<String, dynamic> toJson() {
//     // final Map<String, dynamic> data = new Map<String, dynamic>();
//     // data['code'] = this.code;
//     // data['focussed'] = this.focussed;
//     // if (this.city != null) {
//     //   data['city'] = this.city.map((v) => v.toJson()).toList();
//     // }
//     // return data;
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = code;
//     data['focussed'] = focussed;
//     data['city']=city;
//     return data;
//   }
// }
// class City  {
//   int cityId;
//   String name;
//
//   City ({required this.cityId, required this.name});
//
//   factory City .fromJson(Map<String, dynamic> json) {
//    return City (
//        cityId : json['cityId'],
//     name : json['name'],
//
//    );  }
//
//
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cityId'] = this.cityId;
//     data['name'] = this.name;
//     return data;
//   }
// }
//
//
// //
// // class dsthanhpho
// // {
// //   int code;
// //   int focussed;
// //   List<City> city;
// //   dsthanhpho({required this.code, required this.focussed, required this.city});
// //   factory dsthanhpho.fromJson(Map<String, dynamic> json) {
// //     var list = json['city'] as List;
// //     return new dsthanhpho(
// //         code : json['code'],
// //         focussed : json['focussed'],
// //         city: list.map((i) => City.fromJson(i)).toList());
// //   }}
//
//
//
// // class Thanhpho {
// //   int code;
// //   int focussed;
// //   List<City> city;
// //
// //   Thanhpho({required this.code, required this.focussed, required this.city});
// //
// //   factory Thanhpho.fromJson(Map<String, dynamic> json) {
// //     return Thanhpho(
// //         code = json['code'],
// //     focussed = json['focussed'],
// //     if (json['city'] != null) {
// //       city = new List<City>();
// //       json['city'].forEach((v) {
// //         city.add(new City.fromJson(v));
// //       });
// //     } );
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['code'] = this.code;
// //     data['focussed'] = this.focussed;
// //     if (this.city != null) {
// //       data['city'] = this.city.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }
// //
// // class City {
// //   int cityId;
// //   String name;
// //
// //   City({required this.cityId, required this.name});
// //
// //   factory City.fromJson(Map<String, dynamic> json) {
// //     return City (
// //     cityId = json['cityId'],
// //     name = json['name'],
// //     );
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['cityId'] = this.cityId;
// //     data['name'] = this.name;
// //     return data;
// //   }
// // }
class CityData {
  int cityId;
  String name;

  CityData({required this.cityId, required this.name});

  factory CityData.fromJson(Map<String, dynamic> json) {
    return CityData(
      cityId: json['cityId'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = cityId;
    data['name'] = name;
    return data;
  }
}
