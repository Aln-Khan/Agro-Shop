import 'package:flutter/material.dart';
import 'package:agro_shop/constants/colors/constants.dart';
import 'package:agro_shop/models/item.dart';
import 'package:agro_shop/widgets/item_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<Item> favoritedItems;
  const FavoritePage({super.key, required this.favoritedItems});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedItems.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Your favorited items will appear here.',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: widget.favoritedItems.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ItemWidget(
                        index: index, itemList: widget.favoritedItems);
                  }),
            ),
    );
  }
}