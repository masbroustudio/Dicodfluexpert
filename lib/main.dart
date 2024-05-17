import 'package:firebase_core/firebase_core.dart';
import 'package:umovieapp/firebase_options.dart';
import 'package:umovieapp/state_util.dart';
import 'package:umovieapp/common/constants.dart';
import 'package:umovieapp/common/utils.dart';
import 'package:umovieapp/injection.dart' as di;
import 'package:umovieapp/presentation/pages/about_page.dart';
import 'package:umovieapp/presentation/pages/home_movie_page.dart';
import 'package:umovieapp/presentation/pages/movies/movie_detail_page.dart';
import 'package:umovieapp/presentation/pages/movies/popular_movies_page.dart';
import 'package:umovieapp/presentation/pages/movies/search_page.dart';
import 'package:umovieapp/presentation/pages/movies/top_rated_movies_page.dart';
import 'package:umovieapp/presentation/pages/tv_series/now_playing_tv_series_page.dart';
import 'package:umovieapp/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:umovieapp/presentation/pages/tv_series/search_tv_series_page.dart';
import 'package:umovieapp/presentation/pages/tv_series/top_rated_tv_series_page.dart';
import 'package:umovieapp/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:umovieapp/presentation/provider/movies/movie_detail_notifier.dart';
import 'package:umovieapp/presentation/provider/movies/movie_list_notifier.dart';
import 'package:umovieapp/presentation/provider/movies/movie_search_notifier.dart';
import 'package:umovieapp/presentation/provider/movies/popular_movies_notifier.dart';
import 'package:umovieapp/presentation/provider/movies/top_rated_movies_notifier.dart';
import 'package:umovieapp/presentation/provider/movies/watchlist_movie_notifier.dart';
import 'package:umovieapp/presentation/provider/tv_series/now_playing_tv_series_notifier.dart';
import 'package:umovieapp/presentation/provider/tv_series/popular_tv_series_notifier.dart';
import 'package:umovieapp/presentation/provider/tv_series/top_rated_tv_series_notifier.dart';
import 'package:umovieapp/presentation/provider/tv_series/tv_series_detail_notifier.dart';
import 'package:umovieapp/presentation/provider/tv_series/tv_series_list_notifier.dart';
import 'package:umovieapp/presentation/provider/tv_series/tv_series_search_notifier.dart';
import 'package:umovieapp/presentation/provider/tv_series/watchlist_tv_series_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<NowPlayingTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTvSeriesNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: Get.navigatorKey,
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case PopularMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => SearchPage());
            case NowPlayingTvSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (_) => NowPlayingTvSeriesPage(),
              );
            case PopularTvSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => PopularTvSeriesPage());
            case TopRatedTvSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TopRatedTvSeriesPage());
            case SearchTvSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => SearchTvSeriesPage());
            case TvSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
