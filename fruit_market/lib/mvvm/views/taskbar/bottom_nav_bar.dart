import 'package:flutter/material.dart';
import 'package:fruit_market/mvvm/viewmodels/change_scr.dart';
import 'package:fruit_market/mvvm/viewmodels/change_tab.dart';

import 'package:provider/provider.dart';



class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key, 
    required this.activeIndex, 
  }) : super(key: key);

  final int activeIndex;

  final List navbarItems = List.unmodifiable([
    {'icon': Icons.home_outlined, 'title': 'HOME'},
    {'icon': Icons.shopping_cart_outlined, 'title': 'Shopping cart'},
    {'icon': Icons.favorite_border_outlined, 'title': 'Favourite'},
    {'icon': Icons.account_circle_outlined, 'title': 'My Account'}
  ]);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: 
          List.generate(navbarItems.length, (index){
            return BottomNavbarItems(icon: navbarItems[index], index: index, activeIndex: activeIndex);
          }),
      ),
    );
  }
}

class BottomNavbarItems extends StatelessWidget {
  const BottomNavbarItems({
    Key? key, this.icon, 
    required this.index, 
    required this.activeIndex, 
  }) : super(key: key);

  final dynamic icon;
  final int index;
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    final changeScrNotifier = Provider.of<ChangeScrNotifier>(context);
    final changeTab = Provider.of<ChangeTabNotifier>(context);
    return InkWell(
      onTap: (){
        changeScrNotifier.setIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon['icon'],color: activeIndex==index ? Colors.green : null),
          Text(icon['title'],style: TextStyle(color: activeIndex==index ? Colors.green : null),),
        ],
      ),
    );
  }
}