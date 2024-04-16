import 'package:cart/components/cart-card.dart';
import 'package:cart/provider/cart.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void remove(int index) {
    Provider.of<ShopNotifier>(context, listen: false).removeFromCart(index);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.black87,
              title: Text(
                "Removed from cart successfully.",
                style: TextStyle(color: Colors.white),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopNotifier>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Cart",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600)),
                    Text(
                      '${provider.cartItems.length}'.padLeft(2, '0') + ' Items',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              provider.cartItems.length > 0
                  ? Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.builder(
                            itemCount: provider.cartItems.length,
                            itemBuilder: (context, index) => CartCard(
                                remove: () => remove(index),
                                shoe: provider.cartItems[index]),
                          )),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Cart is empty'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
