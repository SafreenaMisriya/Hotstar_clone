
import 'package:flutter/material.dart';
import 'package:hotstar/Handlers/notifier.dart';
import 'package:hotstar/Screens/newandhot/topupcoming_screen.dart';
import 'package:hotstar/services/api_service.dart';


class MyTabbedScreen extends StatelessWidget {
  const MyTabbedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2, 
      child: 
         Expanded(
           child: Column(
            children:  [
              
              
             const  TabBar(
                  tabs: [
                    Tab(text: 'Trending',),
                    Tab( text: 'Newly Added'),
             
                  ],
                ),
           
           Expanded(
             child: TabBarView(
              children: [
                ComingsoonScreen(futurefunction: movieupcoming(), valueNotifier: upcoming),
                ComingsoonScreen(futurefunction: loadhorror(), valueNotifier: horrotmovies)
              ],
                     ),
           ),
            ]
                 ),
         )
       
    )  ;
        
    
  }
}