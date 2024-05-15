import 'package:flutter/material.dart';
import 'package:agro_shop/constants/colors/constants.dart';
import 'package:agro_shop/models/item.dart';
import 'package:agro_shop/screens/detail_page.dart';
import 'package:agro_shop/widgets/item_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _itemCategories = [
    'Techiques',
    'Foods',
    'Tools',
    'Seeds',
    'Fertilizers',
  ];

  late List<Item> _itemList;
  late List<Item> _filteredItemList;

  @override
  void initState() {
    super.initState();
    _itemList = Item.itemList;
    _filteredItemList = _filterItemsByCategory(_itemCategories[_selectedIndex]);
  }

  List<Item> _filterItemsByCategory(String category) {
    return _itemList.where((item) => item.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black54.withOpacity(.6),
                      ),
                      const Expanded(
                        child: TextField(
                          showCursor: true,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          
          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 50.0,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _itemCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        _filteredItemList = _filterItemsByCategory(_itemCategories[index]);
                      });
                    },
                    child: Text(
                      _itemCategories[index],
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: _selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.w300,
                        color: _selectedIndex == index
                            ? Constants.primaryColor
                            : Constants.blackColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 5),

          // Используем Flexible для GridView.builder, чтобы он занимал доступное пространство
          Flexible(
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 7.0,
                mainAxisSpacing: 3.0,
              ),
              itemCount: _filteredItemList.length > 20 ? 20 : _filteredItemList.length,
              itemBuilder: (BuildContext context, int index) {
                Item item = _filteredItemList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: DetailPage(itemID: item.itemID),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: ItemWidget(
                    index: _itemList.indexOf(item),
                    itemList: _itemList,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
