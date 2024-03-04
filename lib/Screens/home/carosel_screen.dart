// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

String apikey = "0a1f20e89d7de2a0af3860eef181687d";

class CarsolSliderScreen extends StatefulWidget {
  final ValueNotifier<List<dynamic>> valueNotifier;

  const CarsolSliderScreen({super.key, required this.valueNotifier});

  @override
  State<CarsolSliderScreen> createState() => _CarsolSliderState();
}

class _CarsolSliderState extends State<CarsolSliderScreen> {
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    loadCarosel();
  }

  loadCarosel() async {
    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apikey&language=en-US&page=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final items = jsonDecode(body);
      final movieList = items["results"];
      widget.valueNotifier.value =
          movieList.map((movie) => movie['poster_path']).toList();
      // ignore: avoid_print
      print(widget.valueNotifier.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 450,
            child: CarouselSlider.builder(
              itemCount: widget.valueNotifier.value.length,
              itemBuilder: (context, index, realIndex) {
                final imageUrl =
                    'https://image.tmdb.org/t/p/w500${widget.valueNotifier.value[index]}';
                return buildImage(imageUrl, index);
              },
              options: CarouselOptions(
                autoPlay: true,
                height: 450,
              ),
            ),
          ),
          const SizedBox(height: 12),
          builderIndicator(),
        ],
      ),
    );
  }

  Widget buildImage(String imageUrl, int index) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget builderIndicator() => AnimatedSmoothIndicator(
        effect: const SwapEffect(
          activeDotColor: Colors.white,
          type: SwapType.yRotation,
          dotWidth: 6,
          dotHeight: 6,
        ),
        activeIndex: activeIndex,
        count: 6,
      );
}
