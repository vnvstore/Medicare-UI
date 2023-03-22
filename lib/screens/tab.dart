import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:medicare/screens/chat.dart';
import 'package:medicare/screens/doctor.dart';
import 'package:medicare/styles/colors.dart';
import 'package:medicare/screens/home.dart';
import 'package:medicare/screens/schedule.dart';
import 'package:medicare/utils/constant.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

List<Map> navigationBarItems = [
  {'icon': Icons.home, 'index': 0},
  {'icon': Icons.local_hospital, 'index': 1},
  {'icon': Icons.calendar_today, 'index': 2},
  {'icon': Icons.message, 'index': 3},
];

class _TabScreenState extends State<TabScreen> {


  InterstitialAd? _interstitialAd;
  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? Constant.interstitialAdIdForAndroid
      : Constant.interstitialAdIdForIos;

  int _selectedIndex = 0;
  int _countSelect = 0;

  void goToSchedule() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  void loadAd() async {
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            //debugPrint('$ad loaded.');
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            //debugPrint('InterstitialAd failed to load: $error');
          },
        )
    );


  }


  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(
        onPressedScheduleCard: goToSchedule,
      ),
      DoctorScreen(),
      ScheduleScreen(),
      ChatScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(MyColors.primary),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        selectedItemColor: Color(MyColors.primary),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          for (var navigationBarItem in navigationBarItems)
            BottomNavigationBarItem(
              icon: Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border(
                    top: _selectedIndex == navigationBarItem['index']
                        ? BorderSide(color: Color(MyColors.bg01), width: 5)
                        : BorderSide.none,
                  ),
                ),
                child: Icon(
                  navigationBarItem['icon'],
                  color: _selectedIndex == navigationBarItem['index']
                      ? Color(MyColors.bg01)
                      : Color(MyColors.bg02),

                ),
              ),
              label: '',
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _countSelect++;
          if(_countSelect > 4){
            _countSelect = 0;
            _interstitialAd?.show();
            loadAd();
          }
          _selectedIndex = value;
        }),
      ),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    _interstitialAd?.dispose();
  }
}
