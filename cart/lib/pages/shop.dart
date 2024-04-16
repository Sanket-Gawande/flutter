import 'package:cart/components/shoe-card.dart';
import 'package:cart/model/shoe.dart';
import 'package:cart/provider/cart.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  void addToCart(Shoe shoe) {
    Provider.of<ShopNotifier>(context, listen: false).addToCart(shoe);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            backgroundColor: Colors.black87,
            title: Text(
              "${shoe.title} has been added to cart successfully.",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopNotifier>(builder: (context, provider, child) {
      // provider.init();
      return Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Column(children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 24,
                          color: Colors.grey,
                        )),
                  ]),
            ),
            Text(
              'Everyone flies, Some flies longer than others.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hot picks 🔥',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                      child: Text(
                    'See all',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                  ))
                ],
              ),
            ),
            // ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: 5,
            //   itemBuilder: (context, index) => ShoeCard(
            //       shoe: Shoe(
            //           desc: "akfsdg",
            //           imagePath: "/assets/images/icon.png",
            //           price: 12,
            //           title: "New Shoe")),
            // )
            SizedBox(
              height: 20,
            ),
            provider.allProducts.length <= 0
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'No products found'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                : Container(
                    height: 410,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.allProducts.length,
                        itemBuilder: (context, index) {
                          Shoe shoe = Shoe(
                              desc: provider.allProducts[index].desc,
                              imagePath:
                                  "assets/images/products/shoe-${index + 1}.png",
                              price: provider.allProducts[index].price,
                              title: provider.allProducts[index].title);
                          return ShoeCard(
                              addToCart: () => addToCart(shoe), shoe: shoe);
                        }),
                  ),
          ]));
    });
  }
}
