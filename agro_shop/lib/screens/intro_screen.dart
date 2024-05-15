// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:agro_shop/screens/forgot_password_page.dart';
import 'package:agro_shop/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:agro_shop/constants/localization/strings_kz.dart';
import 'package:agro_shop/constants/localization/strings_en.dart';
import 'package:agro_shop/constants/localization/strings_ru.dart';
import 'package:agro_shop/constants/colors/constants.dart';
import 'package:agro_shop/screens/root_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  String selectedLanguage = 'Қазақ';

  List<String> languages = ['Қазақ', 'English', 'Русский'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: PopupMenuButton<String>(
          icon: const Icon(
            Icons.language,
            color: Colors.green,
          ),
          onSelected: (String value) {
            setState(() {
              selectedLanguage = value;
            });
          },
          itemBuilder: (BuildContext context) {
            return languages.map((String language) {
              String flagImage = _getFlagImagePath(language);
              return PopupMenuItem<String>(
                value: language,
                child: Row(
                  children: [
                    Image.asset(
                      flagImage,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(language),
                  ],
                ),
              );
            }).toList();
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const SignIn()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 0),
              child: Text(
                _getSkipText(selectedLanguage),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              _createPage(
                image: 'assets/images/onb1.png',
                title: getTitle(selectedLanguage, 'titleOne'),
                description: getDescription(selectedLanguage, 'descriptionOne'),
              ),
              _createPage(
                image: 'assets/images/onb2.png',
                title: getTitle(selectedLanguage, 'titleTwo'),
                description: getDescription(selectedLanguage, 'descriptionTwo'),
              ),
              _createPage(
                image: 'assets/images/onb3.png',
                title: getTitle(selectedLanguage, 'titleThree'),
                description: getDescription(selectedLanguage, 'descriptionThree'),
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignIn()),
                      );
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getSkipText(String language) {
    switch (language) {
      case 'Қазақ':
        return KzStrings.skipText;
      case 'English':
        return EnStrings.skipText;
      case 'Русский':
        return RuStrings.skipText;
      default:
        return '';
    }
  }

  String getTitle(String language, String key) {
    switch (language) {
      case 'Қазақ':
        return KzStrings.localizedStrings[key] ?? '';
      case 'English':
        return EnStrings.localizedStrings[key] ?? '';
      case 'Русский':
        return RuStrings.localizedStrings[key] ?? '';
      default:
        return '';
    }
  }

  String getDescription(String language, String key) {
    switch (language) {
      case 'Қазақ':
        return KzStrings.localizedStrings[key] ?? '';
      case 'English':
        return EnStrings.localizedStrings[key] ?? '';
      case 'Русский':
        return RuStrings.localizedStrings[key] ?? '';
      default:
        return '';
    }
  }

  String _getFlagImagePath(String language) {
    switch (language) {
      case 'Қазақ':
        return 'assets/images/kz_flag.png';
      case 'English':
        return 'assets/images/usa_flag.png';
      case 'Русский':
        return 'assets/images/russia_flag.png';
      default:
        return '';
    }
  }

  Widget _createPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Constants.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
