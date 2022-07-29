import 'dart:convert';
import 'package:cinema/models/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MovieModelApi with ChangeNotifier{
  List<MovieModel> MovieData=[];
  bool loading=false;

  Future<void> getData()async{
    final m=await getMovie('tt1375666');
    final m3=await getMovie('tt4154796');
    final m4=await getMovie('tt0468569');
    final m5=await getMovie('tt0114709');

    MovieData.add(m);
    MovieData.add(m3);
    MovieData.add(m4);
    MovieData.add(m5);
    loading=true;
    notifyListeners();


  }

  Future<MovieModel> getMovie(String imdbId) async {
    var uri = Uri.https('movie-details1.p.rapidapi.com', '/imdb_api/movie',
        { "id":imdbId });
    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "d6828c4c90msh77657279cfc6825p1de655jsn68fcd35fd2ee",
      "X-RapidAPI-Host": "movie-details1.p.rapidapi.com",
      "useQueryString": "true"
    });

    final data = jsonDecode(response.body);

    MovieModel M=MovieModel.moviesFromSnapshot(data);
    print(M.image);
    return M;
  }
}