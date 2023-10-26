class UserModel {
  final int id;
  final String phone;
  final String username;
  final String firstName;
  final String lastName;
  final String photo;
  final bool active;

  UserModel({
    required this.id,
    required this.phone,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.active,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phone: json['phone'],
      username: json['username'],
      firstName: json['firstName']??" ",
      lastName: json['lastName']??" ",
      photo: json['photo']??"",
      active: json['active'],
    );
  }
}
