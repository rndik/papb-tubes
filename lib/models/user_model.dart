class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? profilePhotoUrl;
  String? token;
  String? roles; // Tambahkan properti role

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.profilePhotoUrl,
    this.token,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      profilePhotoUrl: json['profile_photo_url'],
      token: json['token'],
      roles: json['roles'], // Ambil role dari JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
      'roles': roles, // Sertakan role dalam JSON
    };
  }
}
