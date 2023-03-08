import 'package:music_roster_admin/models/user/user_role.dart';

class UserModel {
  final String uid;
  String name;
  String? email;
  String? phoneNumber;
  // String? imageUrl;
  List<UserRole> roles;

  UserModel({
    required this.uid,
    required this.name,
    this.email,
    this.phoneNumber,
    // this.imageUrl,
    required this.roles,
  });

  static UserModel get emptyUser {
    return UserModel(uid: '', name: '', roles: []);
  }
}
