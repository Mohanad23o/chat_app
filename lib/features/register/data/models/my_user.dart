class MyUser {
  static const String collectionName = 'user';
  String name;
  String uId;
  String email;

  MyUser({required this.name, required this.email, required this.uId});

  MyUser.fromJson(Map<String, dynamic> json)
      : this(
            email: json['email'] as String,
            name: json['name'] as String,
            uId: json['uId'] as String);

  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name, 'uId': uId};
  }
}
