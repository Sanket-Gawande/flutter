import 'package:cart/components/bottom-bar.dart';
import 'package:cart/pages/cart.dart';
import 'package:cart/pages/shop.dart';
import 'package:cart/provider/cart.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeRoute = 0;

  void navigateTo(int index) {
    setState(() {
      activeRoute = index;
    });
  }

  List<Widget> screens = [Shop(), Cart()];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShopNotifier>(
      create: (context) => ShopNotifier(),
      builder: (context, child) => Scaffold(
          backgroundColor: Colors.grey.shade200,
          bottomNavigationBar: BottomBar(
            navigateTo: navigateTo,
          ),
          appBar: AppBar(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
            leading: Builder(
                builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 28,
                        color: Colors.black87,
                      ),
                    )),
            backgroundColor: Colors.transparent,
          ),
          drawer: Drawer(
            backgroundColor: Colors.grey.shade900,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset(
                      'assets/images/logo-nike.png',
                      color: Colors.white,
                      width: 150,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: ListTile(
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      leading: Icon(Icons.home),
                      title: Text('Shop'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: ListTile(
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      leading: Icon(Icons.info_rounded),
                      title: Text('About'),
                    ),
                  )
                ]),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                  ),
                ),
              ],
            ),
          ),
          body: screens[activeRoute]),
    );
  }
}
