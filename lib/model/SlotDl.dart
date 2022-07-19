import 'package:test11/model/time.dart';

class Slot{
  int code;
  List<Date> slot;

  Slot({required this.code, required this.slot});

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      code: json['code'],
      slot: json['slot'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['slot'] = slot;
    return data;
  }
}