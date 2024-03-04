import 'package:flutter/material.dart';
import 'package:hotstar/Screens/home/home_screen.dart';
import 'package:hotstar/Screens/myspace/myspace_screen.dart';
import 'package:hotstar/Screens/newandhot/newandhot_screen.dart';
import 'package:hotstar/Screens/search/search_screen.dart';

class Homecontent extends StatefulWidget {
 const Homecontent({super.key});

 @override
 State<Homecontent> createState() => _HomecontentState();
}

class _HomecontentState extends State<Homecontent> {
 int _currentIndex = 0;

 PageController pageController = PageController();
 final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const HotScreen(),
    const Myspace()
 ];

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          itemCount: _pages.length,
          onPageChanged: (index) {
            FocusScope.of(context).unfocus();
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(115, 104, 103, 103),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          pageController.jumpToPage(index);
        },
       selectedItemColor: Colors.white,
       unselectedItemColor: Colors.white30,
       selectedLabelStyle:const TextStyle(color: Colors.white),
       unselectedLabelStyle:const TextStyle(color: Colors.white),
        items: const [
          BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(115, 104, 103, 103),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
             backgroundColor: const Color.fromARGB(115, 104, 103, 103),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
             backgroundColor: const Color.fromARGB(115, 104, 103, 103),
            icon: Icon(
              Icons.whatshot,
              color: Colors.white,
            ),
            label: 'New & Hot',
            
          ),
          BottomNavigationBarItem(
             backgroundColor: const Color.fromARGB(115, 104, 103, 103),
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
            label: 'My Space',
          ),
        ],
      ),
    );
 }
}

