import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema/Screens/movie_screen.dart';
import 'package:cinema/components/Bubble.dart';
import 'package:cinema/components/default_button.dart';
import 'package:cinema/components/gradient_button.dart';
import 'package:cinema/components/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_models.api.dart';

class MainMovies extends StatefulWidget {
  String UserName;
  MainMovies({Key? key,required this.UserName}) : super(key: key);

  @override
  _MainMoviesState createState() => _MainMoviesState();
}

class _MainMoviesState extends State<MainMovies> {
  int current_index=1;
  final urlImages = [
    Image.network(
        "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX1000_.jpg"),
    Image.network("https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_FMjpg_UX1000_.jpg"),
    Image.network(
        "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg"),
    Image.network('https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_.jpg')
    ];
  
  @override
  Widget build(BuildContext context) {

    return Consumer<MovieModelApi>(
      builder: (context,provider,_){
      return Scaffold(
          backgroundColor: Colors.black38,
          body: Container(
            decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end:Alignment.bottomCenter,colors: [Colors.black,Colors.black87,Colors.pink]),),
            child:
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 90,),
                    CarouselSlider.builder(
                        itemCount: provider.MovieData.length,
                        options: CarouselOptions(height: MediaQuery.of(context).size.height),
                        itemBuilder: (context, index, realIndex) =>
                            Container(
                              width: 300,
                              decoration: const BoxDecoration(color: Colors.black87,borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30),)),

                            child: movieCard(urlImages[index],provider.MovieData[index].name,
                              provider.MovieData[index].genre,provider.MovieData[index].rating,
                              provider.MovieData[index].runtime,provider.MovieData[index].storyLine),
                            )
                        ,
                      ),
                  ],
                ),
            ),
    );}
    );}
Widget movieCard(Image image,String title,String genre,num rating,String runtime,String description){
  return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          ClipRRect( borderRadius: const BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0)),
            child: image),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,10,0,10),
            child: SizedBox(width: 300,child: Text(title,textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Bubble(genre,85),
              const SizedBox(width: 5,),
             Bubble("IMDB "+rating.toString(),85),
             const SizedBox(width: 5),
              Bubble(runtime,85),]
          ),
          const SizedBox(height: 10,),
          StarRating(rating.toDouble()),
          const SizedBox(height: 10,),
          gradientButton(
              text: "Details",
              first: const Color(0xffff5983),
              second: Colors.orangeAccent,
              radius: 5,width: 270,height: 40,
              fontSize: 20,
              fontWeight: FontWeight.bold,textColor: Colors.white,
            function: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieScreen(title: title,image: image,genre: genre,rating: rating,description:description,UserName: widget.UserName,)),);
            }
          ),
        ]
    );
   }
}
