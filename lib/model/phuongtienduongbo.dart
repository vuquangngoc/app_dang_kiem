class dsphuongtienduongbo {
  int vehicleId;
  String typeVehicle;
  String nameVehicle;

  dsphuongtienduongbo({required this.vehicleId, required this.typeVehicle, required this.nameVehicle});

 factory dsphuongtienduongbo.fromJson(Map<String, dynamic> json) {
   return dsphuongtienduongbo(
    vehicleId : json['vehicleId'],
    typeVehicle : json['typeVehicle'],
    nameVehicle : json['nameVehicle'],
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleId'] = this.vehicleId;
    data['typeVehicle'] = this.typeVehicle;
    data['nameVehicle'] = this.nameVehicle;
    return data;
  }
}
