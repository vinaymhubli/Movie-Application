import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_clone_app/models/topratedmovies.dart';
import 'package:insta_clone_app/models/trending.dart';
import 'package:insta_clone_app/models/tv.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Netflix extends StatefulWidget {
  Netflix({Key? key}) : super(key: key);

  @override
  State<Netflix> createState() => _NetflixState();
}

class _NetflixState extends State<Netflix> {
  List Trendingmovies = [];
  List Topratedmovies = [];
  List Topratedtvshows = [];
  final String apikey = '767763f1609874a860f538bc7f31af46';
  final Readaccesstokan =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Njc3NjNmMTYwOTg3NGE4NjBmNTM4YmM3ZjMxYWY0NiIsInN1YiI6IjYyMGM4M2RjZTIxMDIzMDAxYjBhMzMzNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3Ranc0iI-ge4YlvDH46lplOBLraVm0zrIT8RlathOj4';
  @override
  void initState() {
    super.initState();
    Loadmovies();
  }

  Loadmovies() async {
    final tmdbWithCustomLogs = TMDB(ApiKeys(apikey, Readaccesstokan),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();

    print(trendingresults);
    setState(() {
      Trendingmovies = trendingresults['results'];
      Topratedmovies = topratedresults['results'];
      Topratedtvshows = tvresults['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title:
              Text("NETFLIX ", style: GoogleFonts.bebasNeue(color: Colors.red,fontSize: 45,wordSpacing:10.0,)),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
            TV(tv: Topratedtvshows),
            TrendingMovies(trending: Trendingmovies),
            TopratedMovies(toprated: Topratedmovies),
          ],
        ));
  }
}
