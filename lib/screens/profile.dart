import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/styles/colors.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(.94),
        appBar: AppBar(
          title: null,
          centerTitle: true,
          backgroundColor: Color(MyColors.primary),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // user card
              SimpleUserCard(
                userName: "Jane Doe",
                userProfilePic: AssetImage("assets/person.jpeg"),
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.person,
                    iconStyle: IconStyle(),
                    title: 'Personal',
                    subtitle: null,
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.family_restroom,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Family',
                    subtitle: null,
                  ),

                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.account_balance,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                    ),
                    title: 'Bank Account',
                    subtitle: null,
                  ),
                ],
              ),
              // You can add a settings title
              SettingsGroup(
                settingsGroupTitle: "Account",
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.exit_to_app_rounded,
                    title: "Sign Out",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.repeat,
                    title: "Change email",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.delete_solid,
                    title: "Delete account",
                    titleStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}