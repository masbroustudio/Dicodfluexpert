import 'package:umovieapp/presentation/pages/about_page.dart';
import 'package:umovieapp/presentation/pages/movies/movie_list_page.dart';
import 'package:umovieapp/presentation/pages/tv_series/tv_series_list_page.dart';
import 'package:umovieapp/presentation/pages/watchlist_movies_page.dart';
import 'package:flutter/material.dart';

class HomeMoviePage extends StatefulWidget {
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  int _bottomNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.movie),
      label: 'Movies',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.live_tv_outlined),
      label: 'TV Series',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.remove_red_eye),
      label: 'Watchlist',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info_outline),
      label: 'About',
    ),
  ];

  final List<Widget> _listWidget = [
    MovieListPage(),
    TvSeriesListPage(),
    WatchlistPage(),
    AboutPage(),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
