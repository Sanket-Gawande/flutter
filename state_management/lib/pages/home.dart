import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/home.provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.iron,
            color: Colors.white,
          ),
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey.shade700,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.car_crash,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.traffic,
                  color: Colors.white,
                )),
          ],
        ),
        backgroundColor: Colors.grey.shade50,
        body: ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
          child: Consumer<HomeProvider>(
            builder: (context, provider, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  provider.message,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: (provider.eligible == false)
                          ? Colors.red.shade400
                          : Colors.green.shade400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          provider.checkEligibility(19);
                        },
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )),
                    IconButton(
                        onPressed: () {
                          provider.checkEligibility(17);
                        },
                        icon: const Icon(Icons.cancel, color: Colors.red))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
