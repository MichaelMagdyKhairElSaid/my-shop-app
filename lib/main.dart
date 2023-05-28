

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iq_project/register.dart';
import 'CategoryPage.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        // primaryColor:Color(0xF32121AB)
      ),
      home: HomePage(),
    );
  }
}
//-------------------------------------------------------------------------------
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),margin: EdgeInsets.all(60),
                    decoration: BoxDecoration(border: Border.all(width: 5, color: Colors.black ) ,
                        // image: DecorationImage(
                        // image: AssetImage('assets/flutter_icons/rangoli.png'), repeat: ImageRepeat.repeat,scale:20,colorFilter:ColorFilter.mode(Colors.white, BlendMode.color)),
                      color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),),],
                    ),

                    width: size.width*1-120,

                      child: Column(
                        children: [
                          Image.asset('assets/flutter_icons/cart.png',scale: 5),
                          SizedBox(height: 20,),
                          Text('My Shop',style:TextStyle(fontWeight:FontWeight.w800,color: Colors.black,fontSize: 30),)
                        ],
                      )
                  ),
                ]),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25,vertical:10 ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25,vertical:10 ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a your Password',
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('Go to Category Page',),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black,),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage()));
                },
              ),
              ElevatedButton(
                child: Text('regester',style: TextStyle(backgroundColor:Colors.transparent),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      elevation: 0,),

                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                },
              )


            ],
          ),
        ),
      ),
    );
  }
}


