import 'package:flutter/material.dart';
import 'package:flutter_moview_people/models/people_popular.dart';
import 'package:flutter_moview_people/utils/contants.dart';
import 'package:google_fonts/google_fonts.dart';

class PeopleDetailScreen extends StatefulWidget {
  const PeopleDetailScreen({Key? key, required this.actor}) : super(key: key);

  final Actor actor;

  @override
  _PeopleDetailScreenState createState() => _PeopleDetailScreenState();
}

class _PeopleDetailScreenState extends State<PeopleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.dstIn),
                          image: NetworkImage(
                              '$apiImageUrl${widget.actor.profilePath}'))))),
          Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
            child: _buildMoviesList(widget.actor.knownFor),
          ),
          Positioned(
              top: 50,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ClipOval(
                    child: Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.white, child: Icon(Icons.chevron_left))),
              ))
        ],
      ),
    );
  }

  Widget _buildMoviesList(List<KnownFor>? list) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: list?.length,
        itemBuilder: (context, index) {
          KnownFor movie = list![index];
          return Container(
            height: 200,
            margin: EdgeInsets.only(right: 10.0, left: index == 0 ? 20 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      child: Image.network(
                        '$apiImageUrl${movie.posterPath}',
                        fit: BoxFit.cover,
                        height: 150,
                        width: 100,
                      ),
                    )),
                Container(
                  width: 100,
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(movie.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.raleway(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 10)),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(movie.releaseDate?.split('-')[0] ?? '',
                      style: GoogleFonts.raleway(
                          fontStyle: FontStyle.normal, fontSize: 10)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
