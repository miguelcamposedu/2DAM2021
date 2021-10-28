import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MovieService } from 'src/app/services/movie.service';


export interface DialogMovieNewData {
  title: string;
}

@Component({
  selector: 'app-dialog-movie-new',
  templateUrl: './dialog-movie-new.component.html',
  styleUrls: ['./dialog-movie-new.component.css']
})
export class DialogMovieNewComponent implements OnInit {
  movieTitle = '';
  dialogTitle = '';
  hasErrors = false;

  constructor(
    private movieService: MovieService, 
    public dialogRef: MatDialogRef<DialogMovieNewComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogMovieNewData) { }

  ngOnInit(): void {
    this.dialogTitle = this.data.title;
  }

  saveMovie() {
    if(this.movieTitle == '') {
      this.hasErrors = true;
    } else {
      this.hasErrors = false;
      this.movieService.addMovie(this.movieTitle).subscribe(result => {
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
