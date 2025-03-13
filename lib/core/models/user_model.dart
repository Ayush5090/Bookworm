import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String? userName;
  @HiveField(1)
  String? userEmail;
  @HiveField(2)
  String? userNumber;
  @HiveField(3)
  String? userProfilePic;

  UserModel(
      {this.userName, this.userEmail, this.userNumber, this.userProfilePic});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userEmail = json['user_email'];
    userNumber = json['user_phone'];
    userProfilePic = json['user_profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userNumber;
    data['user_profile_image'] = this.userProfilePic;
    return data;
  }
}
