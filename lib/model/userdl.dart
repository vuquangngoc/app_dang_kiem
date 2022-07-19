class UserDl{
  String?  objectId;

  UserDl({required this.objectId});

  factory UserDl.fromJson(Map<String, dynamic> parsedJson) {
    return UserDl(
      objectId: parsedJson['objectId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = objectId;
    return data;
  }
}