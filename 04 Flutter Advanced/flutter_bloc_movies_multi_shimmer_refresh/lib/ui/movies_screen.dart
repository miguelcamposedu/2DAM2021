import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_movies/bloc/movies_bloc/movies_bloc.dart';
import 'package:flutter_bloc_movies/models/movies/movies_response.dart';
import 'package:flutter_bloc_movies/repository/constants.dart';
import 'package:flutter_bloc_movies/repository/movie_repository/movie_repository.dart';
import 'package:flutter_bloc_movies/repository/movie_repository/movie_repository_impl.dart';
import 'package:flutter_bloc_movies/ui/widgets/error_page.dart';
import 'package:flutter_bloc_movies/ui/widgets/shimmer_horizontal_list.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MovieRepository movieRepository;
  late MoviesBloc _popularMoviesBloc;
  late MoviesBloc _topRatedMoviesBloc;

  @override
  void initState() {
    super.initState();
    movieRepository = MovieRepositoryImpl();
    _popularMoviesBloc = MoviesBloc(movieRepository)..add(FetchMovieWithType(Constant.popular));
    _topRatedMoviesBloc = MoviesBloc(movieRepository)..add(FetchMovieWithType(Constant.topRated));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _popularMoviesBloc),
          BlocProvider(create: (context) => _topRatedMoviesBloc)
        ],
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Pop Corn'),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                _popularMoviesBloc.add(FetchMovieWithType(Constant.popular));
                _topRatedMoviesBloc.add(FetchMovieWithType(Constant.topRated));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: _createBody(context)))));
  }

  Widget _createBody(BuildContext context) {
    return Column(children: [
      BlocBuilder<MoviesBloc, MoviesState>(
        bloc: _popularMoviesBloc,
        builder: (context, state) {
          if (state is MoviesInitial) {
            return const ShimmerHorizontalList();
          } else if (state is MovieFetchError) {
            return ErrorPage(
              message: state.message,
              retry: () {
                context
                    .watch<MoviesBloc>()
                    .add(FetchMovieWithType(Constant.popular));
              },
            );
          } else if (state is MoviesFetched) {
            return _createMovieView('Popular', context, state.movies);
          } else {
            return const Text('Not support');
          }
        },
      ),
      BlocBuilder<MoviesBloc, MoviesState>(
        bloc: _topRatedMoviesBloc,
        builder: (context, state) {
          if (state is MoviesInitial) {
            return const ShimmerHorizontalList();
          } else if (state is MovieFetchError) {
            return ErrorPage(
              message: state.message,
              retry: () {
                context
                    .watch<MoviesBloc>()
                    .add(FetchMovieWithType(Constant.topRated));
              },
            );
          } else if (state is MoviesFetched) {
            return _createMovieView('Top Rated', context, state.movies);
          } else {
            return const Text('Not support');
          }
        },
      ),
    ]);
  }

  Widget _createMovieView(String title, BuildContext context, List<Movie> movies) {
    final contentHeight = MediaQuery.of(context).size.height / 3;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20.0, right: 16.0),
          height: 48.0,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward, color: Colors.red),
            ],
          ),
        ),
        SizedBox(
          height: contentHeight,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _createMovieViewItem(context, movies[index]);
            },
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.transparent,
              width: 6.0,
            ),
            itemCount: movies.length,
          ),
        ),
      ],
    );
  }

  Widget _createMovieViewItem(BuildContext context, Movie movie) {
    final width = MediaQuery.of(context).size.width / 3;
    return Container(
      width: width,
      height: double.infinity,
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 10.0,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SizedBox(
          width: width,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              imageUrl: '${Constant.imageUrl}${movie.posterPath}',
              width: width,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
