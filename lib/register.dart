import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:iq_project/ThirdPage.dart';
import 'package:iq_project/main.dart';
import 'package:email_validator/email_validator.dart';

void main() {

  runApp(register());
}

class register extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0x44000000),
        elevation: 0,
          title: Text('Register', style:TextStyle(color: Colors.black,fontSize:35,fontWeight:FontWeight.w700,)),
          centerTitle: true,
          leading: IconButton(
            onPressed:(){  Navigator.pop(context);},
            icon: Icon(Icons.arrow_back , color: Colors.black,),
          ),
        ),
        body:  Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                    Container(
                      padding: EdgeInsets.only(top:50,bottom: 10,left: 25,right: 25),
                      child: Icon(CupertinoIcons.person_alt_circle,size:150,shadows: [BoxShadow(color:Colors.grey,blurRadius:8,spreadRadius:6, offset: const Offset(0, 3))]),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25,vertical:10 ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a your Email',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: Text('Go to Home Page'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black,),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                      },
                    )
                  ],

                ),
          ),
        ),
        ),
    );
  }

}

