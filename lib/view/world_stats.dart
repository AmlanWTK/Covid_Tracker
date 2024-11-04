// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:covid/Models/reusable.dart';
import 'package:covid/Models/world_stat_model.dart';
import 'package:covid/Services/states_services.dart';
import 'package:covid/neu_box.dart';
import 'package:covid/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
class WorldStats extends StatefulWidget {
  const WorldStats({super.key});

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {

  late final AnimationController _controller=AnimationController(
    duration: Duration(seconds: 3),
    vsync: this,
    
    
    )..repeat();
    
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorlist = <Color> [
    Color(0xff4285F4),
     Color(0xff1aa260),
      Color(0xffde5246),
      Color(0xff9c27b0),
    // Color(0xffffc107)

  ];
  
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices=StatesServices();
    return Scaffold(

    body: SafeArea(//safearea automatically padding use kore 
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.01),
            FutureBuilder(
              future:statesServices.fetchWorldStatesRecords() ,
            
             builder:(context,AsyncSnapshot<WorldStatModel> snapshot){
              if(!snapshot.hasData){
                return Expanded(
                  flex: 1,
                  
                  child: SpinKitFadingCircle(
                    //SpinKitFadingCircle customizable loading spinners
                    color: Colors.white,
                    size: 50,
                    controller: _controller,
                  )
                  );


              }
              else{
                return Column(
                  children: [
                      PieChart(
              dataMap: {
                //"Total":20, nijera define korle
                "Total":double.parse(snapshot.data!.cases!.toString()),
                "Recovered":double.parse(snapshot.data!.recovered!.toString()),
                "Deaths":double.parse(snapshot.data!.deaths!.toString()),
                //"Active":double.parse(snapshot.data!.active!.toString()),
                //"Tests":double.parse(snapshot.data!.tests!.toString())
        
            },

            //data percentage a show korte
            chartValuesOptions:ChartValuesOptions(
              showChartValuesInPercentage: true
            ) ,


            chartRadius: MediaQuery.of(context).size.width/3.2,
            //movie the piechart from right to left
            legendOptions: LegendOptions(
              legendPosition: LegendPosition.left
            ),
        
            //animating the pie chart
            animationDuration: Duration(milliseconds: 1200),

            //chartype decide kore kivbe pie cgart show hobw
            chartType: ChartType.ring,  //another charttype is disc
            colorList: colorlist,
            ),
            SizedBox(height: 35,),
           
            NeuBox(child: Column(
              children: [   
                // Reusable(title: 'Total', value: '200'),             
                 Reusable(title: 'Total', value: snapshot.data!.cases!.toString()),
                 Reusable(title: 'Recovered', value: snapshot.data!.recovered!.toString()),
                 Reusable(title: 'Deaths', value: snapshot.data!.deaths!.toString()),
                 Reusable(title: 'Critical', value: snapshot.data!.critical!.toString()),
                 Reusable(title: 'Active', value: snapshot.data!.active!.toString()),
                 Reusable(title: 'TodayCases', value: snapshot.data!.todayCases!.toString()),
                 Reusable(title: 'TodayRecovered', value: snapshot.data!.todayRecovered!.toString()),

              ],
            )
            ),

            SizedBox(height: 70,),
            GestureDetector(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CountriesList()));

              },


              child: NeuBox(child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text("Track Countries",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                
                )
                
                ),
              )),
            )                   
                  ],
                );

              }


             }
              ),
            //building pie chart
          
          ],
        
        ),
      )
      ),

    );
  }
}