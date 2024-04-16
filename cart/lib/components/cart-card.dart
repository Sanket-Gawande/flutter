import 'package:cart/model/shoe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartCard extends StatelessWidget {
  Shoe shoe;
  void Function() remove;
  CartCard({super.key, required this.remove, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            shoe.imagePath,
            width: 80,
            height: 80,
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoe.title,
                  maxLines: 1,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  shoe.desc,
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: remove,
            child: Icon(
              Icons.delete,
              color: Colors.red,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
