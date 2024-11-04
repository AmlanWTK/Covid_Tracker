// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:covid/Models/reusable.dart';
import 'package:covid/neu_box.dart';
import 'package:flutter/material.dart';
class DetailedScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,totalDeaths,active,critical,todayRecovered;
   DetailedScreen({
    
    super.key,
    
   required this.name,
   required this.image,
   required this.totalCases,
   required this.totalDeaths,
   required this.active,
   required this.critical,
   required this.todayRecovered,
 
   
    
    });

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
             alignment: Alignment.topCenter,
             children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.067),//mediaquery amader puro screen ar acces dey 
                child: NeuBox(                                                           //if we use larger screen then the size willa utomatically increase 
                  child: Column(
                    children: [
                      Reusable(title: 'Cases', value: widget.totalCases.toString()),
                      Reusable(title: 'Recovered', value: widget.todayRecovered.toString()),
                      Reusable(title: 'Deaths', value: widget.totalDeaths.toString()),
                      Reusable(title: 'Critical', value: widget.critical.toString()),
                      Reusable(title: 'Cases', value: widget.totalCases.toString()),
                      Reusable(title: 'Active Cases', value: widget.active.toString()),
                      
                    ],
                  )
                ),
              ),

              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )

             ],
          )
        ],
      ),


      
    );
  }
}