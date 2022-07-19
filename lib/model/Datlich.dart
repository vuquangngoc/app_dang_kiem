class DatlichDK {
  String type;
  int code;
  String message;


  DatlichDK({required this.type, required this.code, required this.message});

  factory DatlichDK.fromJson(Map<String, dynamic> parsedJson) {
    return DatlichDK(
        type: parsedJson['type'],
        code: parsedJson['code'],
        message: parsedJson['message']

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
