import 'package:cinema/Screens/profile.dart';
import 'package:cinema/providers/Tickets.dart';
import 'package:cinema/providers/movie_models.api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'booked_screen.dart';
import 'main_movies.dart';

class TransitionScreen extends StatefulWidget {
  final String UserName;

  TransitionScreen({Key? key,required String this.UserName}) : super(key: key);

  @override
  _TransitionScreenState createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen> {
  int selectedIndex=1;
  late List screens;
  @override

  void initState() {
    screens=[ProfileScreen(UserName: widget.UserName.toString()), MainMovies(UserName: widget.UserName.toString()),BookedTicketsScreen()];
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TicketsProvider()..getData("Janelock"),
      child: Scaffold(
        body: Provider.of<MovieModelApi>(context).loading==true? screens[selectedIndex]:Center(child: CircularProgressIndicator()),
        bottomNavigationBar: BottomNavigationBar(

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Booked Tickets',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.orangeAccent,
          onTap: (index)=>setState(() {
            selectedIndex=index;
          }),
        ),
      ),
    );
  }
}
