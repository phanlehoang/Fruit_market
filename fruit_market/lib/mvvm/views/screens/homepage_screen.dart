import 'package:flutter/material.dart';
import 'package:fruit_market/widgets/dimension.dart';
import 'package:provider/provider.dart';

import '../../../define/define_texts.dart';
import '../../viewmodels/change_tab.dart';
import '../tab//vegatables/vegetable_tab.dart';
import '../tab//dryfruits/dryfruits_tab.dart';
import '../tab/fruits/fruit_tab.dart';
import '../taskbar//searchBar.dart';
import '../taskbar//top_nav_bar.dart';

class HomePage extends StatelessWidget {
  final List<String> topnavbaritems = ['Vegetables', 'Fruits', 'Dry Fruits'];

  @override
  Widget build(BuildContext context) {
    final tab = Provider.of<ChangeTabNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //searchBar
              SearchBar(),
              const SizedBox(height: 10),
              //top navbar
              SizedBox(
                  height: size.height * 0.1,
                  width: size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(topnavbaritems.length, (index) {
                        return InkWell(
                            onTap: () {
                              tab.setTab(index);
                            },
                            child: TopNavBar(
                                currentTab: tab.currentTab,
                                index: index,
                                title: topnavbaritems[index]));
                      }))),
              //body
              IndexedStack(
                index: tab.currentTab,
                children: [
                  VegetableTab(),
                  FruitTab(),
                  DryFruitTab(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.lightGreen[600],
      title: Text.rich(TextSpan(
        children: [
          TextSpan(
              text: ConstText.appbar_title1,
              style: TextStyle(
                  fontSize: Dimensions.font26, fontWeight: FontWeight.bold)),
          TextSpan(
              text: ConstText.appbar_title2,
              style: TextStyle(
                  fontSize: Dimensions.font20, fontWeight: FontWeight.bold))
        ],
      )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications,
                size: 20,
              )),
        )
      ],
    );
  }
}
