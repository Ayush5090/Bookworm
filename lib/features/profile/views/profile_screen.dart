import 'package:bookworm/core/resources/pallet.dart';
import 'package:bookworm/features/common/widgets/app_button.dart';
import 'package:bookworm/features/profile/controller/profile_controller.dart';
import 'package:bookworm/features/profile/widgets/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileController profileController;

  @override
  void initState() {
    profileController = Get.put(ProfileController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, _) {},
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: GetBuilder<ProfileController>(
              id: 'user',
              builder: (_) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.bottomRight,
                                children: [
                                  GetBuilder<ProfileController>(
                                    id: 'profile_pic',
                                    builder: (_) => CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          profileController.getProfileImage(),
                                    ),
                                  ),
                                  Positioned(
                                      right: 20,
                                      child: GestureDetector(
                                          onTap: () => profileController
                                              .pickUserProfile(),
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Pallet.primary),
                                            child: Icon(
                                              Icons.add,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ))),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      ProfileTextField(
                        displayText: profileController.user?.userName ?? '',
                        hintText: 'Name',
                        suffixIcon: Icon(
                          Icons.person,
                          color: Pallet.primary,
                        ),
                        controller: profileController.nameController,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      ProfileTextField(
                        hintText: 'Email',
                        displayText: profileController.user?.userEmail ?? '',
                        suffixIcon: Icon(
                          Icons.email,
                          color: Pallet.primary,
                        ),
                        controller: profileController.emailController,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      ProfileTextField(
                        hintText: 'Phone',
                        displayText: profileController.user?.userNumber ?? '',
                        suffixIcon: Icon(
                          Icons.phone,
                          color: Pallet.primary,
                        ),
                        controller: profileController.numberController,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      AppButton(
                        text: 'Update Profile',
                        fontSize: 16,
                        onTap: () => profileController.updateUser(),
                        backgroundColor: Pallet.primary,
                        fontColor: Colors.white,
                        borderRadius: 15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
        ),
      ),
    );
  }
}
