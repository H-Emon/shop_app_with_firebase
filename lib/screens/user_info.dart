import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';


import '../Widgets/User info/user_info_widgets.dart';
import '../consts/colors.dart';
import '../provider/dark_theme_provider.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  late ScrollController _scrollController;

 @override
  void initState(){
    super.initState();
    _scrollController=ScrollController();
    _scrollController.addListener(() {
      setState((){});
    });
  }


  @override
  Widget build(BuildContext context) {
   final themeChange=Provider.of<DarkThemeProvider>(context);
    return Scaffold(

        body: Stack(
          children: [
            CustomScrollView(
              controller:_scrollController,
              slivers:<Widget>[
                SliverAppBar(
                  elevation:4,
                  automaticallyImplyLeading:false,
                  expandedHeight:200,
                  pinned:true,
                  flexibleSpace:LayoutBuilder(
                    builder:(BuildContext context , BoxConstraints constraints){
                      return Container(
                        decoration:BoxDecoration(
                          gradient:LinearGradient(
                              colors:[
                                ColorConst.starterColor,
                                ColorConst.endColor,
                              ],
                              begin: FractionalOffset(0.0 , 0.0),
                              end:FractionalOffset(1.0 ,0.0),
                              tileMode:TileMode.clamp,
                              stops:[0.0,0.1]
                          ),
                        ),
                        child:FlexibleSpaceBar(
                          collapseMode:CollapseMode.parallax,
                          centerTitle:true,
                          title:Row(
                            crossAxisAlignment:CrossAxisAlignment.center,
                            children: [
                              AnimatedOpacity(
                                  opacity: constraints.biggest.height <=110? 1.0 :0, duration: Duration(milliseconds:300)),
                              SizedBox(
                                width:12,
                              ),
                              Container(
                                height:kToolbarHeight/1.8,
                                width: kToolbarHeight/1.8,
                                decoration:BoxDecoration(
                                    boxShadow:[
                                      BoxShadow(
                                          color:Colors.white,
                                          blurRadius:1.0
                                      ),],
                                    shape:BoxShape.circle,
                                    image:DecorationImage(
                                        fit:BoxFit.fill,
                                        image:NetworkImage(
                                            "https://cdn.pixabay.com/photo/2017/12/16/06/41/avatar-3022215_960_720.jpg"
                                        )
                                    )
                                ),
                              ),
                              SizedBox(
                                width:12,
                              ),
                              Text(
                                  "Guest"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child:Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Information",style:TextStyle(
                          color:Colors.grey,
                          fontWeight:FontWeight.bold,
                          fontSize:22
                      ),),
                      Divider(
                        height:15,
                        thickness:2,
                        color:Colors.grey,
                      ),
                      BodyListTile(
                        titleText:"Email",
                        icon:Icons.email,),
                      BodyListTile(
                        titleText:"Email",
                        icon:Icons.email,),
                      BodyListTile(
                        titleText:"Email",
                        icon:Icons.email,),
                      BodyListTile(
                        titleText:"Email",
                        icon:Icons.email,),
                      BodyListTile(
                        titleText:"Email",
                        icon:Icons.email,),
                      BodyListTile(
                        titleText:"Email",
                        icon:Icons.email,),
                      ListTileSwitch(
                          value:themeChange.darkTheme,
                          leading:Icon(Icons.dark_mode),
                          onChanged: (value){
                            setState(()=>themeChange.darkTheme=value);
                          }),
                      BodyListTile(
                        titleText:"Email",
                        icon:Icons.email,),
                      BodyListTile(
                        titleText:"Email",
                        icon:Icons.email,),
                      BodyListTile(
                        titleText:"Email",
                        icon:Icons.email,),

                    ],
                  ),
                ),

              ],
            ),
            _buildFab()
          ]

        )
    );


  }
  Widget _buildFab(){
   final double defultTopMargin=200-4.0;
   final double scaleStart=160.0;
   final double scaleEnd=scaleStart/2;
   double top=defultTopMargin;
   double scale=1.0;
   if(_scrollController.hasClients){
     double offset=_scrollController.offset;
     top -=offset;
     if(offset<defultTopMargin-scaleStart){
       scale=1.0;
     }else if (offset<defultTopMargin-scaleEnd){
       scale=(defultTopMargin-scaleEnd-offset)/scaleEnd;
     }else {
       scale=0.0;
     }
   }
   return Positioned(
     top:top,
       right:16,
       child: Transform(
         transform:Matrix4.identity()..scale(scale),
         alignment:Alignment.center,
         child:FloatingActionButton(
           backgroundColor:Colors.purple,
           heroTag:"btn",
           onPressed:(){},
           child:Icon(Icons.photo_camera),
         ),
       ));
  }
}
