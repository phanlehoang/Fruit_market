import 'package:flutter/material.dart';

class ChangeAddress extends StatefulWidget {

  ChangeAddress({Key? key}) : super(key: key);

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  TextEditingController _textEditingController = TextEditingController(text: "Address");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Change Address'),
          backgroundColor: Colors.lightGreen[600],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Address',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
                TextFormField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  maxLines: 5,
                ),
                SizedBox(
                  height: size.height*0.2,
                ),
                SizedBox(
                  height: size.height*0.08,
                  width: size.width,
                  child: RaisedButton(
                    onPressed: () {
        
                    },
                    color: Colors.lightGreen[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      'CHANGE',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
