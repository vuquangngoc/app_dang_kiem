class PTDK{
  int vehicleId;
  String typeVehicle;
  String nameVehicle;

  PTDK({required this.vehicleId, required this.typeVehicle,required this.nameVehicle});

  factory PTDK.fromJson(Map<String, dynamic> json) {
    return PTDK(
        vehicleId: json['vehicleId'],
        typeVehicle: json['typeVehicle'],
        nameVehicle: json['nameVehicle']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleId'] = vehicleId;
    data['typeVehicle'] = typeVehicle;
    data['nameVehicle'] = nameVehicle;
    return data;
  }
}