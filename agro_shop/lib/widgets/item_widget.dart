import 'package:flutter/material.dart';
import 'package:agro_shop/constants/colors/constants.dart';
import 'package:agro_shop/models/item.dart';
import 'package:agro_shop/screens/detail_page.dart';
import 'package:page_transition/page_transition.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key, required this.index, required this.itemList,
  });

  final int index;
  final List<Item> itemList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(
                  itemID: itemList[index].itemID,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.9),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 85.0,
                    child:
                    Image.asset(itemList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: 105,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemList[index].category,),
                      Text(
                        itemList[index].itemName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.only(top: 110, right: 10),
              child: Text(
                itemList[index].price.toString() + r' ₸',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Constants.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}