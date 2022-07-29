
import 'package:cinema/Screens/Register_screen.dart';
import 'package:cinema/providers/Tickets.dart';
import 'package:cinema/providers/movie_models.api.dart';
import 'package:cinema/providers/provider_seats.dart';
import 'package:cinema/providers/them_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>MovieModelApi()..getData(),),
            ChangeNotifierProvider(create: (_)=>ThemeModal(),),
            ChangeNotifierProvider(create: (_)=>providerSeats()..initializeSeats(),),
            ChangeNotifierProvider(create: (_)=>TicketsProvider()..db..getData('Janelock')),

          ],

          child:Consumer(
            builder: ( context, ThemeModal themeNotifier, child) {
              return  MaterialApp(

                debugShowCheckedModeBanner: false,

                theme:themeNotifier.is_Dark ? ThemeData.dark():ThemeData.light(),
                home: RegisterScreen()//TransitionScreen(),
              );
            },
          ),
        ),
    );
       /* ChangeNotifierProvider(
            create: (context) =>
            MovieModelApi()..getData(),

            builder: (context, child) {
              *//*if(MovieModelApi().loading==false){
              return CircularProgressIndicator();
            }
            else{*//*
              return const TransitionScreen();
            }
        ));*/
  }
}
