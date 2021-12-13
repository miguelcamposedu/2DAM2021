import { Component, OnInit } from '@angular/core';
import { GasolineraFavFirebase } from 'src/app/models/interfaces/gasolineras-firebase.interface';
import { GasolinerasFirebaseService } from 'src/app/services/gasolineras-firebase.service';

@Component({
  selector: 'app-gasolineras-fav-list',
  templateUrl: './gasolineras-fav-list.component.html',
  styleUrls: ['./gasolineras-fav-list.component.css']
})
export class GasolinerasFavListComponent implements OnInit {
  gasolinerasFavList: GasolineraFavFirebase[] = [];

  constructor(private gasolineraFirebaseService: GasolinerasFirebaseService) { }

  ngOnInit(): void {
    this.gasolineraFirebaseService.getFavorites().subscribe(resp =>  {
      this.gasolinerasFavList = resp;
    });
  }

  deleteFavorito(gasolinera: GasolineraFavFirebase) {
    this.gasolineraFirebaseService.deleteFavorite(gasolinera.id).then(resp => {
      alert(`eliminada la gasolinera ${gasolinera.rotulo}`);
    });
  }

}
