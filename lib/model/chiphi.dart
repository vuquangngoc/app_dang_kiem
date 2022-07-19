class Charge {
  String costPkd;
  String costCert;
  String costPdb;
  String? costService;
  String costTotalTemp;
  String voucherCode;

  Charge(
      {required this.costPkd,
        required this.costCert,
        required this.costPdb,
        required this.costService,
        required this.costTotalTemp,
        required this.voucherCode});

  factory Charge.fromJson(Map<String, dynamic> json) {
    return Charge(
        costPkd: json['costPkd'],
        costCert: json['costCert'],
        costPdb: json['costPdb'],
        costService: json['costService'],
        costTotalTemp: json['costTotalTemp'],
        voucherCode: json['voucherCode']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['costPkd'] = costPkd;
    data['costCert'] = costCert;
    data['costPdb'] = costPdb;
    data['costService'] = costService;
    data['costTotalTemp'] = costTotalTemp;
    data['voucherCode'] = voucherCode;
    return data;
  }
}
