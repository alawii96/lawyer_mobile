import 'package:flutter/material.dart';
import 'package:lawyer_mobile/main.dart';

class CategoryListItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool selected;
  const CategoryListItem(
      {super.key,
      required this.name,
      required this.icon,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: selected ? Colors.white : Colors.transparent,
        border: Border.all(
          color: selected ? mainMaterialBlue : Colors.black12,
          width: 1,
        ),

        // color: selected
        //     ? mainMaterialBlue.withOpacity(0.1)
        //     : mainMaterialYellow.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selected ? mainMaterialBlue : Colors.black54,
          ),
          Text(
            name,
            style: TextStyle(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal),
          )
        ],
      ),
    );
  }
}
