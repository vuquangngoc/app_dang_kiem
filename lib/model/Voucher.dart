
class Voucher {
  int code;
  String message;

  Voucher({required this.code, required this.message});

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
        code : json["code"],
        message :json["message"]
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    data["message"] = this.message;
    return data;
  }
}