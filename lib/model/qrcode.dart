class Qrcode {
  String objectId;

  Qrcode({required this.objectId});

  factory Qrcode.fromJson(Map<String, dynamic> json) {
    return Qrcode(objectId : json['objectId']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    return data;
  }
}
