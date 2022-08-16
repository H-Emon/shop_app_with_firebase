import 'package:flutter/material.dart';
import 'package:shop_app_with_firebase/screens/search.dart';
import 'package:shop_app_with_firebase/screens/user_info.dart';

import 'Cart/cart.dart';
import 'Feeds/feeds.dart';
import 'home.dart';



class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  late List<Widget> _page;
  int _selectPageIndex = 0;

  @override
  void initState() {

    _page = [
      HomeScreen(),
      FeedsScreen(),
      SearchScreen(),
      Cart(),
      UserInfoScreen(),

    ];
  }

  void _selectPage(int index) {
    setState(() => {_selectPageIndex = index});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectPageIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                  color: Colors.grey, width: 1.5),
            ),
          ),
          child: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            currentIndex: _selectPageIndex,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.blue,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.rss_feed),
                label: "Feeds",
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "User",
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          backgroundColor:Colors.purple,
          hoverElevation:10,
          splashColor: Colors.grey,
          tooltip: "Search",
          elevation: 4,
          child: Icon( Icons.search,size:35,),
          onPressed: () {setState(() => _selectPageIndex = 2);
          },
        ),
      ),

    );
  }
}
