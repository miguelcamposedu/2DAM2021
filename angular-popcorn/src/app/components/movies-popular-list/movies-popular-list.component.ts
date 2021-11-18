import { Component, OnInit } from '@angular/core';
import { Movie, MoviesPopularResponse } from 'src/app/models/interfaces/movies-popular.interface';
import { AuthService } from 'src/app/services/auth.service';
import { MoviesService } from 'src/app/services/movies.service';

@Component({
  selector: 'app-movies-popular-list',
  templateUrl: './movies-popular-list.component.html',
  styleUrls: ['./movies-popular-list.component.css']
})
export class MoviesPopularListComponent implements OnInit {
  popularMovies: Movie[] = [];

  constructor(private moviesService: MoviesService,
    private authService: AuthService
    ) { }

  ngOnInit(): void {
    
    this.moviesService.getPopularMovies().subscribe(popularMoviesResponse => {
      this.popularMovies = popularMoviesResponse.results;
    });
  }

}
