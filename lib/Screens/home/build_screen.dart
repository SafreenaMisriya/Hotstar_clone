import 'package:flutter/material.dart';
import 'package:hotstar/Screens/moviedetails/view_screen.dart';
import 'package:hotstar/services/api_service.dart';

// ignore: must_be_immutable
class MovieScreen extends StatelessWidget {
  Future<void> futurefunction;
  ValueNotifier<List<dynamic>> valueNotifier;
  MovieScreen(
      {super.key, required this.futurefunction, required this.valueNotifier});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futurefunction,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('error :${snapshot.error}');
          } else {
            return Container(
              height: 200,
              // width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: valueNotifier.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: GestureDetector(
                        child: Container(
                          color: Colors.grey,
                          child: Image.network(
                            imageUrl +
                                valueNotifier.value[index]['poster_path'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewScreen(
                                    index: index,
                                    valueNotifier: valueNotifier,
                                  )));
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          }
        });
  }
}
