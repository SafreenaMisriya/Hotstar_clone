
import 'package:flutter/material.dart';
import 'package:hotstar/Handlers/notifier.dart';
import 'package:hotstar/Screens/home/carosel_screen.dart';
import 'package:hotstar/Screens/home/reuse_screen.dart';
import 'package:hotstar/Screens/home/build_screen.dart';
import 'package:hotstar/services/api_service.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         SingleChildScrollView(
           child: Column(
            children: [
             
                         Stack(
                          children: [
                             CarsolSliderScreen(valueNotifier: caroselnofity),
                            
                            Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/image/hot.png',
                                      height: 100,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),   
             const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Ink(
                      height: 50,
                      width: 230,
                      color: Color.fromARGB(136, 76, 75, 75),
                      child: const Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow_rounded,color: Colors.white,),
                          Text('Watch Now',style: TextStyle(color: Colors.white),),
                        ],
                      )),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Color.fromARGB(136, 76, 75, 75),
                    child: const Icon(Icons.add,color: Colors.white,),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Latest Releases',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                 Icon(Icons.keyboard_arrow_right_outlined)
               ],
             ),
               const SizedBox(
                height: 8,
              ),
              Latestrelease(valueNotifier:latestrelease,futurefunction: loadlatest(),),
               const SizedBox(
                height: 20,
              ),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Popular Shows',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                 Icon(Icons.keyboard_arrow_right_outlined)
               ],
             ),
               const SizedBox(
                height: 8,
              ),
              MovieScreen(futurefunction: loadlatestmovies(), valueNotifier: popularshows),
               const SizedBox(
                height: 20,
              ),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Upcoming Movies',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                 Icon(Icons.keyboard_arrow_right_outlined),
               ],
             ),
               const SizedBox(
                height: 8,
              ),
              MovieScreen(futurefunction:movieupcoming() , valueNotifier: upcoming),
               const SizedBox(
                height: 20,
              ),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Top Rated Movies',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                 Icon(Icons.keyboard_arrow_right_outlined),
               ],
             ),
               const SizedBox(
                height: 8,
              ),
              MovieScreen(futurefunction: loadtoprated(), valueNotifier: toprated),
              const SizedBox(
                height: 20,
              ),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Crime Movies',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                 Icon(Icons.keyboard_arrow_right_outlined),
               ],
             ),
               const SizedBox(
                height: 8,
              ),
              MovieScreen(futurefunction: loadcrimemovies(), valueNotifier: crimemovie),
               const SizedBox(
                height: 20,
              ),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Top Rated TV Shows',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                 Icon(Icons.keyboard_arrow_right_outlined),
               ],
             ),
               const SizedBox(
                height: 8,
              ),
             MovieScreen(futurefunction: loadromantic(), valueNotifier: romanticmovie),
               const SizedBox(
                height: 20,
              ),
           const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Horror Movies',style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                 Icon(Icons.keyboard_arrow_right_outlined)
               ],
             ),
               const SizedBox(
                height: 8,
              ),
              MovieScreen(futurefunction: loadhorror(), valueNotifier: horrotmovies),
               const SizedBox(height: 30,),
             ElevatedButton(
              style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(const Color.fromARGB(255, 81, 81, 81)), ),
              onPressed: (){}, child:const Text('TV | Movies | Sporsts | More',style:TextStyle(color: Colors.white),)),
              
             
            ]
    ),
         )  
      
   
    );
  }
}

