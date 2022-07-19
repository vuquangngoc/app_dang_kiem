import 'package:flutter/material.dart';
import 'repository.dart';
class StateModel2 {
  String state2;
  List<String> districts2;

  StateModel2({required this.state2, required this.districts2});

  StateModel2.fromJson(Map<String, dynamic> json) :
        state2 = json['state2'],
        districts2 = json['districts2'].cast<String>();


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state2;
    data['districts'] = this.districts2;
    return data;
  }
}