class Date{
  int slot;
  String time;

  Date({required this.slot, required this.time});

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      slot: json['slot'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = slot;
    data['time'] = time;
    return data;
  }
}
