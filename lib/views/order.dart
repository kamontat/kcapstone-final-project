import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kcapstone/components/cartList.dart';
import 'package:kcapstone/models/cart.dart';

import 'package:kcapstone/views/summary.dart';

class Order extends StatelessWidget {
  // final List<String> randomStatus = ["กำลังปรุง", "ปรุงสำเร็จ", "รอคอนเฟิร์ม"];

//  String random() {
//    randomStatus.shuffle(Random());
//    return randomStatus.first;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายการของฉัน"),
      ),
      body: ListView(
        children: SingletonCart().carts.map((cart) {
          return CartList(cart);
          // return Text(cart.totalPrice().toString());
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  print("Filter");
                }),
            IconButton(
                icon: Icon(Icons.history),
                onPressed: () {
                  print("History");
                })
          ],
        ),
      ),
    );
  }
}
