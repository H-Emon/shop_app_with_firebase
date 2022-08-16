import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyListTile extends StatelessWidget {
  final String titleText;
  final String? subTitleText;
  final IconData icon;
  const BodyListTile({
    required this.titleText,
    this.subTitleText,
    required this.icon,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){},
      child: ListTile(
        leading:Icon(icon,color:Colors.grey,),
        title:Text(
          titleText,style:TextStyle(
            color:Colors.grey,
            fontWeight:FontWeight.bold,
            fontSize:18
        ),),
        subtitle:Text(
          subTitleText??"",),
      ),
    );
  }
}
