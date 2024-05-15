import 'package:flutter/material.dart';
import 'package:agro_shop/constants/colors/constants.dart';
import 'package:agro_shop/models/item.dart';
import 'package:agro_shop/widgets/item_widget.dart';

class CartPage extends StatefulWidget {
  final List<Item> addedToCartItems;
  const CartPage({super.key, required this.addedToCartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedToCartItems.isEmpty
          ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/add-cart.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Your Cart is Empty',
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
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: widget.addedToCartItems.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ItemWidget(
                        index: index, itemList: widget.addedToCartItems);
                  }),
            ),
            const Column(
              children: [
                Divider(thickness: 1.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Totals',style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                      Text(r'$', style: TextStyle(
                        fontSize: 24.0,
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}