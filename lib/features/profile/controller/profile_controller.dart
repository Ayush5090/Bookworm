import 'dart:io';
import 'package:bookworm/core/assets/assets.dart';
import 'package:bookworm/core/models/user_model.dart';
import 'package:bookworm/core/services/local_database.dart';
import 'package:bookworm/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends GetxController {
  String profilePicPath = '';
  File? pickedImage;

  late UserModel? user;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController numberController;

  @override
  void onInit() {
    user = LocalDatabase.getUser();
    nameController = TextEditingController();
    emailController = TextEditingController();
    numberController = TextEditingController();
    profilePicPath = user?.userProfilePic ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    super.onClose();
  }

  void updateUser() async {
    if (nameController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        numberController.text.isNotEmpty ||
        pickedImage != null) {
      try {
        // Saving user image to app's local directory
        if (pickedImage != null) {
          final Directory dir = await getApplicationDocumentsDirectory();
          // Extracting picked image name and adding with local directory path
          final localPath = '${dir.path}/${pickedImage!.uri.pathSegments.last}';
          final File localImage = await pickedImage!.copy(localPath);
          profilePicPath = localImage.path;
        }

        UserModel userData = UserModel(
          userName: nameController.text.trim(),
          userEmail: emailController.text.trim(),
          userNumber: numberController.text.trim(),
          userProfilePic: profilePicPath,
        );
        await LocalDatabase.saveOrUpdateUser(userData);
        user = userData;
        update(['user']);

        Utils.showToast('Profile updated successfully');
      } catch (e) {
        debugPrint(e.toString());
        Utils.showToast('Something went wrong');
      }
    } else {
      Utils.showToast('Please fill your details first');
    }
  }

  ImageProvider getProfileImage() {
    if (profilePicPath.isNotEmpty) {
      // If user selects the picture from gallery
      return FileImage(File(profilePicPath));
    } else if (user?.userProfilePic != null && user?.userProfilePic != '') {
      // If user has picture from local db
      return FileImage(File(user!.userProfilePic!));
    } else {
      // Default image
      return const AssetImage(AppAssets.defaultPicture);
    }
  }

  void pickUserProfile() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      pickedImage = File(file.path);
      profilePicPath = file.path;
      update(['profile_pic']);
    }
  }
}
