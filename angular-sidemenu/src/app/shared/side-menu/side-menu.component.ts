import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { DialogMovieNewComponent } from 'src/app/dialogs/dialog-movie-new/dialog-movie-new.component';

@Component({
  selector: 'app-side-menu',
  templateUrl: './side-menu.component.html',
  styleUrls: ['./side-menu.component.css']
})
export class SideMenuComponent implements OnInit {
  currentPage = 'movies';

  constructor(private router: Router, private dialog: MatDialog) { }

  ngOnInit(): void {
    console.log(this.router.url);
  }

  openDialogNewMovie() {
    let dialogRef = this.dialog.open(DialogMovieNewComponent, {
      height: '400px',
      width: '600px',
      disableClose: true,
      data: {
        title: 'Nueva película',
        // id: '1' >> le pasamos el idPelicula 
       }
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result == true) {
        alert('Se ha añadido la película');
        //TODO Refrescaría la lista de películas, para que apareciera la película nueva
        // que se ha añadido.
      } else {
        alert('Se ha cancelado la acción');
      }
    });
  }

}
