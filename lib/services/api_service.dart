
// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'dart:convert';
import 'dart:io';
import 'package:hotstar/Handlers/notifier.dart';
import 'package:http/http.dart ' as http;

String apikey = "0a1f20e89d7de2a0af3860eef181687d";
String accesstoken =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNTMyN2E4NTk5NjMwYjU3OGY5NDAxOGE4YmZjZjk0YiIsInN1YiI6IjY1ZTA4N2VmNTFmOTlhMDE4NTU3MTViNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WXoCiqCLk4PzotVUKtQOkE2FvznstjhsbDJmmZKD_5M";
String imageUrl = 'https://image.tmdb.org/t/p/w500';

Future<void> loadlatestmovies()async{
  final url ='https://api.themoviedb.org/3/tv/popular?api_key=$apikey&language=en-US';
  final uri =Uri.parse(url);
  final response=await http.get(uri);
  if(response.statusCode == 200){
   final body=response.body;
   final items= jsonDecode(body);
   popularshows.value =items["results"];
  
   stdout.write(popularshows.value);
  }
}
 movieupcoming()async{
  final url ='https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey&language=en-US&page=1';
  final uri =Uri.parse(url);
  final response=await http.get(uri);
  if(response.statusCode == 200){
   final body=response.body;
   final items= jsonDecode(body);
   upcoming.value =items["results"];
  stdout.write(upcoming.value);
  }
}
 loadtoprated()async{
  final url ='https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=1';
  final uri =Uri.parse(url);
  final response=await http.get(uri);
  if(response.statusCode == 200){
   final body=response.body;
   final items= jsonDecode(body);
  toprated.value =items["results"];
 stdout.write(toprated.value);
  }
}
 loadlatest()async{
  final url ='https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey&language=en-US&page=1';
  final uri =Uri.parse(url);
  final response=await http.get(uri);
  if(response.statusCode == 200){
   final body=response.body;
   final items= jsonDecode(body);
   latestrelease.value =items["results"];
  stdout.write(latestrelease.value);
  }
}
 loadcrimemovies()async{
  final url ='https://api.themoviedb.org/3/discover/movie?api_key=$apikey&with_genres=80&sort_by=popularity.desc&vote_count.gte=1000&page=1';
  final uri =Uri.parse(url);
  final response=await http.get(uri);
  if(response.statusCode == 200){
   final body=response.body;
   final items= jsonDecode(body);
  crimemovie.value =items["results"];
  stdout.write(crimemovie.value);
  }
}
 loadromantic()async{
  final url ='https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US';
  final uri =Uri.parse(url);
  final response=await http.get(uri);
  if(response.statusCode == 200){
   final body=response.body;
   final items= jsonDecode(body);
  romanticmovie.value =items["results"];
  stdout.write(romanticmovie.value);
  }
}
loadhorror()async{
  final url ='https://api.themoviedb.org/3/trending/movie/week?api_key=$apikey&language=en-US&page=1';
  final uri =Uri.parse(url);
  final response=await http.get(uri);
  if(response.statusCode == 200){
   final body=response.body;
   final items= jsonDecode(body);
 horrotmovies.value =items["results"];
  stdout.write(horrotmovies.value);
  }
}
newlease()async{
  final url ='https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey';
  final uri =Uri.parse(url);
  final response=await http.get(uri);
  if(response.statusCode == 200){
   final body=response.body;
   final items= jsonDecode(body);
  newmovie.value =items["results"];
 stdout.write(newmovie.value);
  }
}
 searchMovies(String query) async {
  isLoading.value = true;
  searchMovie.value.clear();
  final url =
      "https://api.themoviedb.org/3/search/multi?query=$query&api_key=$apikey&include_adult=false&language=en-US";
  final uri = Uri.parse(url);
  final res = await http.get(uri);
  if (res.statusCode == 200) {
    final body = res.body;
    final items = jsonDecode(body);
    searchMovie.value = items['results'];
    searchMovie.notifyListeners();
    isLoading.value = false;
    isLoading.notifyListeners();
  }
}



