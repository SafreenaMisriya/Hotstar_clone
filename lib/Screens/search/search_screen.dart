import 'package:flutter/material.dart';
import 'package:hotstar/Handlers/notifier.dart';
import 'package:hotstar/Screens/search/search_view.dart';
import 'package:hotstar/Screens/search/searchdisplay_screen.dart';
import 'package:hotstar/Screens/moviedetails/view_screen.dart';
import 'package:hotstar/services/api_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            onChanged: (value) {
              setState(() {
                isLoading.value = true;
                searchMovies(value);
              });
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Movies, Shows and more',
              hintStyle: const TextStyle(color: Colors.black),
              suffixIcon: const Icon(
                Icons.mic,
                color: Colors.black,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Text(
              'People Search For',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ValueListenableBuilder(
                valueListenable: searchMovie,
                builder: (context, value, child) {
                  return isLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : value.isEmpty
                          ? Expanded(
                              child: GridViewScreen(
                                  valueNotifier: horrotmovies,
                                  futureFunction: loadhorror()),
                            )
                          : ListView.builder(
                              itemCount: searchMovie.value.length,
                              itemBuilder: (context, index) {
                                String title = value[index]['title'] ??
                                    value[index]['name'];
                                late String? url;
                                if (value[index]["poster_path"] != null) {
                                  url = value[index]["poster_path"];
                                } else {
                                  url = value[index]["backdrop_path"];
                                }

                                String urls = url != null
                                    ? imageUrl + url
                                    : "https://yt3.googleusercontent.com/-i9vS-g8mUx5IL0tsprB9mLW4DMYzODoLdehGvjZBYzzHL42QAqHO_DQ7c6ieKY8z81JPl6f74E=s900-c-k-c0x00ffffff-no-rj";

                                return SizedBox(
                                  height: 200,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => ViewScreen(
                                                  valueNotifier: searchMovie,
                                                  index: index)));
                                    },
                                    child:
                                        SearchDisplay(url: urls, title: title),
                                  ),
                                );
                              },
                            );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
