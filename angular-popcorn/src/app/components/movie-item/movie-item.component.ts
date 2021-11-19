import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DialogLoginComponent } from 'src/app/dialogs/dialog-login/dialog-login.component';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { AuthService } from 'src/app/services/auth.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-movie-item',
  templateUrl: './movie-item.component.html',
  styleUrls: ['./movie-item.component.css']
})
export class MovieItemComponent implements OnInit {
  @Input() movieInput!: Movie;

  constructor(
    private authService: AuthService,
    private dialog: MatDialog
    ) { }

  ngOnInit(): void {
  }

  getMovieImageUrl(movie: Movie) {
    return `${environment.imageBaseUrl}${movie.poster_path}`;
  }

  addFavorite() {
    if(this.authService.isLoggedIn()) {
      //TODO añadir el movieInput a favoritos
    } else {
      this.openLoginDialog();
    }
  }

  addToPlayList() {
    if(this.authService.isLoggedIn()) {
      this.openPlaylistAddDialog();  
    } else {
      this.openLoginDialog();
    }
  }

  openLoginDialog() {
    this.dialog.open(DialogLoginComponent, {
      width: '400px',
      disableClose: true
    });
  }

  openPlaylistAddDialog() {

  }

}
