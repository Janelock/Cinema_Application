

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class providerSeats extends ChangeNotifier{


  List<Seat> seats=new List.empty(growable: true);
  List <int> reserved=new List.empty(growable: true);
 static providerSeats get (context)=> Provider.of<providerSeats>(context,listen: false);
  void initializeSeats (){
    for(int i=0;i<48;i++){
      seats.add(Seat("",0));
    }

  }
  void changeColour (int index){
    if (seats[index].selected==0){
      seats[index].color=Colors.orangeAccent;
     seats[index].selected=1;
     notifyListeners();
    }
    else  if ( seats[index].selected==1){
      seats[index].color=Colors.white;
      seats[index].selected=0;
      notifyListeners();
    }
    else
      seats[index].color=Colors.pinkAccent;

    if( seats[index].selected==1){
      reserved.add(index);
      notifyListeners();
    }
    else if(seats[index].selected==0){
      reserved.remove(index);
      notifyListeners();
    }
  }
  void reservation (){
    for (int i =0 ; i<reserved.length;i++){

      seats[reserved[i]].selected=2;
      seats[reserved[i]].color=Colors.pinkAccent;}

    reserved.clear();

    notifyListeners();
  }

}
class Seat{
  String name;
  int selected;
  Color color;
  Seat(this.name,this.selected , {this.color=Colors.white});
}