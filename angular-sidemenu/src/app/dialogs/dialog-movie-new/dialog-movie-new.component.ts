import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-dialog-movie-new',
  templateUrl: './dialog-movie-new.component.html',
  styleUrls: ['./dialog-movie-new.component.css']
})
export class DialogMovieNewComponent implements OnInit {
  title = '';
  hasErrors = false;

  constructor(private movieService: MovieService, public dialogRef: MatDialogRef<DialogMovieNewComponent>) { }

  ngOnInit(): void {
  }

  saveMovie() {
    if(this.title == '') {
      this.hasErrors = true;
    } else {
      this.hasErrors = false;
      this.movieService.addMovie(this.title).subscribe(result => {
        // Cerrar el cuadro de diálogo
        // Si en el método close() le paso un valor, ese es el valor del 
        // retorno para el componente padre
        this.dialogRef.close(true);
      }, error => {
        this.dialogRef.close(false);
      });
    }
  }

}
