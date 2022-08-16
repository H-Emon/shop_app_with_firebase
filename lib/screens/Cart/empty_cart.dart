import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_with_firebase/consts/colors.dart';
import 'package:shop_app_with_firebase/provider/dark_theme_provider.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/empty_cart.webp"),
              ),
            ),
          ),
          Text(
            "Your Cart is Empty !",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textSelectionColor,
                fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Looks like You didn\'t add\nanything to your cart yet",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: themeChange.darkTheme
                    ? Theme.of(context).disabledColor
                    : ColorConst.subTitle,
                fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(onPressed:(){},
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(16),
            side:BorderSide(
              color:Colors.red,
            ),

          ),
            color:Colors.redAccent,
            child:Text(
              "Shope Now".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
