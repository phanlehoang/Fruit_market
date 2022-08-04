import 'package:flutter/material.dart';
import 'package:fruit_market/mvvm/viewmodels/card_view_model.dart';
import 'package:fruit_market/widgets/color.dart';
import 'package:fruit_market/widgets/dimension.dart';
import 'package:provider/provider.dart';



class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: Dimensions.height45+5,
      child: Stack(
        children: [
          Container(
              height: Dimensions.height30, color: AppColor.bg),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 25,
                        color: Colors.grey.withOpacity(0.5))
                  ]),
              child: TextFormField(
                controller: _controller,
                maxLines: 1,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    _controller.text = value;
                  });
                  provider.getSearchResult(_controller.text);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
