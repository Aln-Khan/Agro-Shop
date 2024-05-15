// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:agro_shop/constants/colors/constants.dart';
import 'package:agro_shop/models/item.dart';
import 'package:agro_shop/screens/cart_page.dart';
import 'package:agro_shop/screens/favorite_page.dart';
import 'package:agro_shop/screens/home_page.dart';
import 'package:agro_shop/screens/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Item> myFavorites = [];
  List<Item> myCart = [];
  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(favoritedItems: myFavorites),
      CartPage(addedToCartItems: myCart),
      const ProfilePage(name: ''),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getTitle(_bottomNavIndex),
          style: const TextStyle(
            color: Constants.blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        selectedItemColor: Constants.primaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _bottomNavIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  String _getTitle(int index) {
    return ['Home', 'Favorite', 'Cart', 'Profile'][index];
  }

  void _onTabTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
      _updateLists();
    });
  }

  void _updateLists() {
    if (_bottomNavIndex == 1) {
      myFavorites = Item.getFavoritedItems();
    } else if (_bottomNavIndex == 2) {
      myCart = Item.addedToCartItems().toSet().toList();
    }
  }
}
