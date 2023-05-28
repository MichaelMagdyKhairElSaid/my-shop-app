import 'package:flutter/material.dart';
import 'package:iq_project/ThirdPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:iq_project/API/postProducts.dart';
import 'package:iq_project/API/DetailsPage.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iq_project/CartPage.dart';
import 'package:badges/badges.dart' as badges;



class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<List<Product>> futureUsers;


  @override
  void initState() {
    super.initState();
    futureUsers = postProducts().getProducts();
  }

  @override
  Widget build(BuildContext context) {
  late  List <Product> productsAddedToCart=[];
     int numOfAddedProduct=0;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0x44000000),
            elevation: 0,
            title: Text('Products',style: TextStyle(color:Colors.black,fontWeight:FontWeight.bold)),
            centerTitle: true,
            leading: IconButton(
              onPressed:(){  Navigator.pop(context);},
              icon: Icon(Icons.arrow_back , color: Colors.black,),

            ),

            actions: [
              badges.Badge(
                position: badges.BadgePosition.topEnd(top: -5, end: 5), //change bage location
                showBadge: true,
                ignorePointer: false,
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(addedtoCart:productsAddedToCart)));},
                badgeContent:
                Text('$numOfAddedProduct'),
                badgeAnimation: badges.BadgeAnimation.scale(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeStyle: badges.BadgeStyle(shape: badges.BadgeShape.circle, badgeColor: Colors.blue, elevation: 0,),
                child: IconButton(onPressed:(){  Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(addedtoCart: productsAddedToCart)));},
                  icon: Icon(CupertinoIcons.cart , color: Colors.black,),),
              ),

            ],
          ),
         body: Center(
    child: FutureBuilder<List<Product>>(
      future: futureUsers,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Product product = snapshot.data?[index];
              return InkWell(
                onTap: (() => {openPage(context, product)}),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey ) ,
                      // image: DecorationImage(
                      // image: AssetImage('assets/flutter_icons/rangoli.png'), repeat: ImageRepeat.repeat,scale:20,colorFilter:ColorFilter.mode(Colors.white, BlendMode.color)),
                      color: Color(0x2fffffff),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),),],
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(left: 25,),
                      child: Row(

                        children: [
                          Expanded(
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.name,style:TextStyle(fontSize:20,fontWeight:FontWeight.w800,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 10,),
                                  Text('${product.price.toString()} L.E',style:TextStyle(fontSize:15,fontWeight:FontWeight.w500),),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Icon(CupertinoIcons.star_fill,size:15,),
                                      SizedBox(width: 5,),
                                      Text(product.ratingsAverage.toString(),style:TextStyle(fontSize:15,fontWeight:FontWeight.w500),),

                                    ],
                                  ),
                                  SizedBox(height: 30,),
                                  ElevatedButton(onPressed:(){
                                    String text = product.name;
                                    List<String> substrings = text.split(' ');
                                   var snackBar = SnackBar(content: Row(
                                     children: [
                                       Icon(CupertinoIcons.check_mark_circled ,color: Colors.white,),
                                       SizedBox(width: 10,),
                                       Text('${substrings[0]} ${substrings[1]} is add to cart',style:TextStyle(fontSize:20),textAlign: TextAlign.center),
                                     ],
                                   ),
                                   backgroundColor: Colors.green,
                                       dismissDirection: DismissDirection.startToEnd,
                                       // action: SnackBarAction(
                                       //   label: 'go to Cart',textColor:Colors.orangeAccent,
                                       //   onPressed: () {
                                       //     // Some code to undo the change.
                                       //   },
                                       // )
                                   );
                                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                     numOfAddedProduct+=1;
                                     print('num of products is $numOfAddedProduct');
                                    productsAddedToCart.add(product);


                                    // Fluttertoast.showToast(
                                    //     msg:'${substrings[0]} ${substrings[1]} is add',
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.BOTTOM,
                                    //     timeInSecForIosWeb: 1,
                                    //     backgroundColor: Colors.green,
                                    //     textColor: Colors.white,
                                    //     fontSize: 16.0
                                    // );
                                  },
                                    child: Text('add item'),
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                                    ),),

                                ],
                              )),
                          Expanded(child:Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(product.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),),

                        ],
                      ),
                    ),
                  ),
                ),
              );

              // return ListTile(
              //   title: Text(product.name),
              //   subtitle: Text(product.name),
              //   trailing: const Icon(Icons.chevron_right_outlined),
              //   onTap: (() => {openPage(context, product)}),
              // );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    ),
    ),

    );

  }

  openPage(context, Product product) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(product: product)));}
}



//----------------------------


// class CategoryPage extends StatefulWidget {
//   final items = List.generate(50, (i) => i);
//    CategoryPage({Key? key}) {
//      loadProduct();}
//
//   loadProduct() async {
//     final results = await UserService().getUser();
//     print(results.length);
//     results.forEach((v) {
//       print(v.email);
//     });
//
//    };
//
//   @override
//   State<CategoryPage> createState() => _CategoryPageState();
// }
//
// class _CategoryPageState extends State<CategoryPage> {
//   Future<Product> postData;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     postData = getPostById();
//   }
//   final List<String> categories = [
//     'Science',
//     'History',
//     'Sports',
//     'Geography',
//     'Movies',
//     'Math',
//     'computer',
//     'tech',
//     'statistics',
//     'physics'
//   ];
//   int _selectedItem=0;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // primarySwatch: Colors.blue,
//         //   primaryColor:Color(0xF354AB21)
//       ),
//       home:
//       // Scaffold(
//       //   appBar: AppBar(
//       //     backgroundColor: Color(0x44000000),
//       //     elevation: 0,
//       //     title: Text('Quiz Categories'),
//       //     centerTitle: true,
//       //
//       //     leading: IconButton(
//       //       onPressed:(){  Navigator.pop(context);},
//       //       icon: Icon(Icons.arrow_back , color: Colors.white,),
//       //
//       //     ),
//       //     actions: [
//       //       IconButton(onPressed:(){}, icon: Icon(Icons.menu_sharp))
//       //     ],
//       //   ),
//       //
//       //   body: Container( //----------------------------------------> add here futerBulider<Post> post is type of object futerBulider will work on
//       //     padding: EdgeInsets.all(16.0),
//       //     child: ListView.builder(
//       //       itemCount: categories.length,
//       //       itemBuilder: (context, index) {
//       //         return Card(
//       //           elevation: 2.0,
//       //           child: ListTile(
//       //             contentPadding: EdgeInsets.symmetric(
//       //               vertical: 40.0,
//       //               horizontal: 24.0,
//       //             ),
//       //             leading:Text(
//       //               categories[index],
//       //               style: TextStyle(
//       //                 fontSize: 20.0,
//       //                 fontWeight: FontWeight.bold,
//       //               ),
//       //             ),
//       //             trailing:Image.asset('assets/flutter_icons/brain.png'),
//       //             onTap: () {
//       //               Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
//       //               // Handle category selection here
//       //               // You can navigate to a new page or perform any other action
//       //               print('Selected category: ${categories[index]}');
//       //             },
//       //           ),
//       //         );
//       //       },
//       //     ),
//       //   ),
//       //   bottomNavigationBar: bottomNavigationBar()
//       // ),
//     );;
//   }
//
//   Widget bottomNavigationBar(){
// return BottomNavigationBar(
//     currentIndex: _selectedItem,
//     onTap:(index){
//       setState(() { print(index);
//       _selectedItem =index; });
//     },
//     type: BottomNavigationBarType.fixed,
//     items: [
//       BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
//       BottomNavigationBarItem(icon: Icon(Icons.person),label:'Profile'),
//       BottomNavigationBarItem(icon: Icon(Icons.calendar_today),label:'Progress'),
//       BottomNavigationBarItem(icon: Icon(Icons.contact_support),label:'Help')
//     ],
//   );
//   }
//
// }

