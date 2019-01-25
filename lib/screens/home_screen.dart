import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift_organiser/screens/tabs/settings.dart';
import 'package:gift_organiser/screens/tabs/wishlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  WishList wishList;
  Settings settings;
  History history;
  List<Widget> _pages;
  Widget _currentPage;
  int _currentPageIndex = 0;

  @override
  void initState() {
    WishList wishlist = WishList();
    History history = History();
    Settings settings = Settings();
    Contributed contributed = Contributed();
    _pages = [wishlist, contributed, history, settings];
    _currentPage = wishlist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GiftOrganiser"),
      ),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Whishlist'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            title: Text('Contributed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Finished'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
            _currentPage = _pages[index];
          });
        },
      ),
    );
  }
}

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(40),
        child: Image.asset('assets/images/work_in_progress.png'));
  }
}

class Contributed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(40),
        child: Image.asset('assets/images/work_in_progress.png'));
  }
}
