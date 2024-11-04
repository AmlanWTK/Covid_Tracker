// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:covid/Services/states_services.dart';
import 'package:covid/neu_box.dart';
import 'package:covid/neu_box1.dart';
import 'package:covid/view/detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices=StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            NeuBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchcontroller,
                  onChanged: (value){  // The onChanged callback is triggered every time the user modifies the text 
                    setState(() {
                      
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search Country name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: statesServices.countriesListApi(), 
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 5,
                        
                        itemBuilder: (context,index){
                          return Shimmer.fromColors(
                            
                            baseColor: Colors.grey.shade700,
                             highlightColor: Colors.grey.shade100,
                             child: Column(
                              children: [
                                ListTile(
                                  title: Container(height: 10,width: 89,color: Colors.white,),
                                  subtitle: Container(height: 10,width: 89,color: Colors.white,),
                                  leading:Container(height: 10,width: 89,color: Colors.white,), 
                                )
                               
                              ],
                             ), 
                             
                             );
                          
                        }
                        
                        );       
                  } else {
                    return ListView.builder(

                      itemCount:snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name=snapshot.data![index]['country'];
                        if(searchcontroller.text.isEmpty){
                          return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedScreen(
                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  name:snapshot.data![index]['country'],
                                  totalCases:snapshot.data![index]['cases'],
                                  todayRecovered: snapshot.data![index]['recovered'],
                                  totalDeaths: snapshot.data![index]['deaths'],
                                  active: snapshot.data![index]['active'],
                                  critical: snapshot.data![index]['critical'],

                                )));
                              },
                              child: NeuBox(
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['continent']),
                                  
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                  image:  NetworkImage(                                                       
                                    snapshot.data![index]['countryInfo']['flag']
                                  ),
                                  fit: BoxFit.cover,
                                   ),
                                
                                ),
                              ),
                            ),
                             SizedBox(height: 20)
                            // Your list item widgets go here
                          ],
                        );


                        }else if(name.toLowerCase().contains(searchcontroller.text.toLowerCase())) {

                           return Column(
                          children: [
                        //commonly used to make non-button widgets, like containers or images, respond to touch interactions in a way that looks and feels like a button.
                                                           
                            NeuBox(
                                child: InkWell(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedScreen(
                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  name:snapshot.data![index]['country'],
                                  totalCases:snapshot.data![index]['cases'],
                                  todayRecovered: snapshot.data![index]['recovered'],
                                  totalDeaths: snapshot.data![index]['deaths'],
                                  active: snapshot.data![index]['active'],
                                  critical: snapshot.data![index]['critical'],
                                )));
                                      
                                    },
                                    title: Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]['continent']),
                                    
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                    image:  NetworkImage(                                                       
                                      snapshot.data![index]['countryInfo']['flag']
                                    ),
                                    fit: BoxFit.cover,
                                     ),
                                  
                                  ),
                                ),
                              ),
                            
                             SizedBox(height: 20)
                            // Your list item widgets go here
                          ],
                        );



                        }
                        else{
                          return Container();

                        }
                        
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
