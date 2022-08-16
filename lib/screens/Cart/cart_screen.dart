import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_with_firebase/provider/dark_theme_provider.dart';

import '../../consts/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange=Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Cart(1)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.delete,
            size: 25,

          )
        ],
      ),
      body: ListView.builder(
           itemCount:10,
           itemBuilder: (context,index)=> Container(
            height: MediaQuery.of(context).size.height * 0.15,
            margin: EdgeInsets.all( 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeChange.darkTheme ? Colors.grey:Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          "assets/images/fridge.jpg",
                          fit: BoxFit.cover,

                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        //color:Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Walton Fridge",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color:themeChange.darkTheme ? Colors.white:Colors.black,
                                      fontSize: 15),
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.purple,
                                  size: 20,

                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color:themeChange.darkTheme ? Colors.white:Colors.black,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "45,000",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.purple,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Sub total:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color:themeChange.darkTheme ? Colors.white:Colors.black,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "\$450.000",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.purple,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Ships Fee",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.purple,
                                      fontSize: 15),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Card(
                                        elevation: 8,
                                        color: Colors.white,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height *
                                          .04,
                                      width: MediaQuery.of(context).size.height *
                                          .06,
                                      child: Card(
                                        elevation: 8,
                                        color: Colors.purple,
                                        child: Center(
                                          child: Text(
                                            "0",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Card(
                                        elevation: 8,
                                        color: Colors.white,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),

      ),
      bottomSheet:Container(
        padding:EdgeInsets.symmetric(horizontal: 10),
        decoration:BoxDecoration(
          border:Border(top:BorderSide(color:Colors.grey,width:0.5))
        ),
        child:Row(
          children: [
            Expanded(
              child: RaisedButton(onPressed:(){},
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(16),
                  side:BorderSide(
                    color:Colors.red,
                  ),

                ),
                color:Colors.redAccent,
                child:Text(
                  "Shope Now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Total:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: themeChange.darkTheme? Colors.white: Colors.black,
                    fontSize: 20),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "US \$1970",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                    fontSize: 20),
              ),
            )

          ],
        ),
      ),
    );
  }
}
