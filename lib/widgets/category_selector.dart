import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages','Online','Groups','Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left:10, top:20, right: 10),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex=index;
              });
            },
                      child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(categories[index], style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900, letterSpacing: 1.2, color: index==selectedIndex? Colors.white : Colors.white60),),
            ),
          );
        },
      ),
    );
  }
}