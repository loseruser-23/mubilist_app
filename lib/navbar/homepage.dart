import 'package:flutter/material.dart';
import '../services/api_service_movie.dart';
import '../models/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiServiceMovie _apiService = ApiServiceMovie();
  late Future<List<Movie>> _futureMovies;

  @override
  void initState() {
    super.initState();
    _futureMovies = _apiService.fetchNowPlayingMovies();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(movie: movie);
            },
          );
        }
        return Center(child: Text('No movies available'));
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  final ApiServiceMovie _apiService = ApiServiceMovie();
  MovieCard({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Colors.black,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.network(
          _apiService.getImageUrl(movie.posterPath),
          width: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, StackTrace) {
            return Image.network(
              'https://via.placeholder.com/100x150?text=No+Image',
              width: 100,
              fit: BoxFit.cover,
            );
          },
        ),
        title: Text(
          movie.title,
          style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          'Release Date: ${movie.releaseDate}',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
