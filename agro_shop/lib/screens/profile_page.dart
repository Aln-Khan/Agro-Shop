import 'package:flutter/material.dart';
import 'package:agro_shop/screens/signin_page.dart';
import 'package:agro_shop/constants/colors/constants.dart';
import 'package:agro_shop/widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  final String name;

  const ProfilePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                    width: 5.0,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: ExactAssetImage('assets/images/profile.png'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '',
                style: TextStyle(
                  color: Constants.blackColor.withOpacity(.3),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ProfileWidget(
                      icon: Icons.person,
                      title: 'My Profile',
                    ),
                    const ProfileWidget(
                      icon: Icons.settings,
                      title: 'Settings',
                    ),
                    const ProfileWidget(
                      icon: Icons.notifications,
                      title: 'Notifications',
                    ),
                    const ProfileWidget(
                      icon: Icons.chat,
                      title: 'FAQs',
                    ),
                    const ProfileWidget(
                      icon: Icons.share,
                      title: 'Share',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          ),
                        );
                      },
                      child: const ProfileWidget(
                        icon: Icons.logout,
                        title: 'Log Out',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
