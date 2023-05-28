import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iq_project/API/postProducts.dart';

class CartPage extends StatefulWidget {
final List<Product> addedtoCart;
const CartPage({
  Key? key,
required this.addedtoCart,
}) : super(key: key);
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  num TotalPrice=0;
  @override
  void initState() {
    super.initState();
    TotalPrice = calcTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0x44000000),
          elevation: 0,
          title: Row(
            children: [
              Text('My Cart',style: TextStyle(color:Colors.black),),
              SizedBox(width: 5),
              Icon(CupertinoIcons.cart,color:Colors.black),
            ],
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed:(){  Navigator.pop(context);},
            icon: Icon(Icons.arrow_back , color: Colors.black,),
          ),
        ),

      body:ListView.builder(
    itemCount: widget.addedtoCart.length,
      itemBuilder: (context, index) {
        Product product = widget.addedtoCart[index];
        return InkWell(
          // onTap: (() => {openPage(context, product)}),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey ),
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
                                  Icon(CupertinoIcons.trash ,color: Colors.white,size:15),
                                  SizedBox(width: 10,),
                                  Text('${substrings[0]} ${substrings[1]} deleted from cart',style:TextStyle(fontSize:15),textAlign: TextAlign.center),
                                ],
                              ),
                                backgroundColor: Colors.red,
                                dismissDirection: DismissDirection.startToEnd,
                                action: SnackBarAction(
                                  label: 'return',textColor:Colors.black,
                                  onPressed: () {
                                    widget.addedtoCart.add(product);
                                  },
                                )
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              widget.addedtoCart.remove(product);
                            },
                              child: Text('Delete'),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
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
    ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(12),
          height: 100.0,
          decoration: BoxDecoration(borderRadius:BorderRadius.vertical(top: Radius.circular(20),),color: Colors.grey[200]),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text('Products Price : ${TotalPrice-50} L.E',style: TextStyle(fontWeight:FontWeight.w700)),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              indent: 50,
              endIndent: 50,
            ),
            Text('Shipment : 40 L.E',style: TextStyle(fontWeight:FontWeight.w700),),
            Divider(
              color: Colors.black,
              height: 10,
              thickness: 1,
              indent: 50,
              endIndent: 50,
            ),
            Text('Total price : ${TotalPrice-10} L.E' ,style: TextStyle(fontWeight:FontWeight.w700)),
          ],),
        )
    );
  }
  num calcTotalPrice(){
num totalPrice=0;
for(var i=0 ;i< widget.addedtoCart.length ; i++){
  totalPrice += widget.addedtoCart[i].price;
}
return totalPrice+50;
  }
}

