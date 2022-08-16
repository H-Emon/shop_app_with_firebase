import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'empty_cart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List productList = [1];
    return SafeArea(
        child: productList.isEmpty
            ? CartEmpty()
            : CartScreen()

    );
  }
}
