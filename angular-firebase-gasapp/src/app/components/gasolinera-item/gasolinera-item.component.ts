import { Component, Input, OnInit } from '@angular/core';
import { GasolinerasListResponse, ListaEESSPrecio } from 'src/app/models/interfaces/gasolineras.interface';
import { GasolinerasFirebaseService } from 'src/app/services/gasolineras-firebase.service';

@Component({
  selector: 'app-gasolinera-item',
  templateUrl: './gasolinera-item.component.html',
  styleUrls: ['./gasolinera-item.component.css']
})
export class GasolineraItemComponent implements OnInit {
  @Input() gasolinera!: ListaEESSPrecio;

  constructor(private gasolineraFirebaseService: GasolinerasFirebaseService) { }

  ngOnInit(): void {
    console.log(this.gasolinera);
  }

  addFavorito() {
    this.gasolineraFirebaseService.addFavorite(this.gasolinera).then(resp => {

    });
  }

}
