import 'package:flutter/material.dart';
import 'package:hotstar/Screens/moviedetails/view_screen.dart';
import 'package:hotstar/services/api_service.dart';

// ignore: must_be_immutable
class GridViewScreen extends StatelessWidget {
  Future<void> futureFunction;
  ValueNotifier<List<dynamic>> valueNotifier;

  GridViewScreen({
    super.key,
    required this.valueNotifier,
    required this.futureFunction,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFunction,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('error :${snapshot.error}');
        } else {
          return SingleChildScrollView(
            child: SizedBox(
              height: 650,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemCount: valueNotifier.value.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ViewScreen(
                          index: index,
                          valueNotifier: valueNotifier,
                        ),
                      ));
                    },
                    child: Container(
                      color: Colors.grey,
                      child: Image.network(
                        imageUrl + valueNotifier.value[index]['poster_path'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
