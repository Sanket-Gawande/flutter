import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme/util/provider/theme.provider.dart';
import 'package:theme/util/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: const ThemeApp(),
  ));
}

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).theme,
      home: Consumer<ThemeNotifier>(
          builder: (context, provider, child) => Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      width: 100,
                      height: 100,
                      child: GestureDetector(
                        onTap: provider.toggleTheme,
                        child: const Center(child: Text('TAP')),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
