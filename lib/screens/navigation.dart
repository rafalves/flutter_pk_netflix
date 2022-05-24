import 'package:flutter/material.dart';
import 'package:flutter_pk_netflix/data/entry.dart';
import 'package:flutter_pk_netflix/providers/entry.dart';
import 'package:flutter_pk_netflix/screens/home.dart';
import 'package:flutter_pk_netflix/screens/watchlist.dart';
import 'package:provider/provider.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  Widget home() => const HomeScreen(key: PageStorageKey('homescreen'));

  @override
  Widget build(BuildContext context) {
    Entry? selected = context.watch<EntryProvider>().selected;

    return FutureBuilder(
        future: context.read<EntryProvider>().list(),
        builder: (context, snapshot) {
          return Scaffold(
            body: home(),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              unselectedItemColor: Colors.white,
              currentIndex: 0,
              onTap: (index) async {
                if (index == 1) {
                  await showDialog(
                      context: context,
                      builder: (context) => const WatchlistScreen());
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Watchlist',
                ),
              ],
            ),
          );
        });
  }
}
