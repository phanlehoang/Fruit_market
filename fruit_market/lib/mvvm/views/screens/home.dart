import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/change_scr.dart';
import '../../viewmodels/change_tab.dart';
import '../taskbar//bottom_nav_bar.dart';
import 'favourite_screen.dart';
import 'homepage_screen.dart';
import 'myaccount_screen.dart';
import 'shoppingcart_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<ChangeScrNotifier>(context);
    return ChangeNotifierProvider(
      create: (context) => ChangeTabNotifier(),
      child: Scaffold(
        body: IndexedStack(
            index: homeNotifier.currentIndex,
            children: [HomePage(), ShoppingCart(), Favourite(), MyAccount()]),
        bottomNavigationBar:
            BottomNavBar(activeIndex: homeNotifier.currentIndex),
      ),
    );
  }
}
