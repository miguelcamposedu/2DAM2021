import { Component, OnInit } from '@angular/core';
import { ListaEESSPrecio } from 'src/app/models/interfaces/gasolineras.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';

@Component({
  selector: 'app-gasolinera-list',
  templateUrl: './gasolinera-list.component.html',
  styleUrls: ['./gasolinera-list.component.css']
})
export class GasolineraListComponent implements OnInit {
  gasolineraList: ListaEESSPrecio[] = [];

  constructor(private gasolineraService: GasolineraService) { }

  ngOnInit(): void {
    this.gasolineraService.getGasolineras().subscribe(resp => {
      console.log(resp);
      let jsonString = JSON.stringify(resp);
      let jsonStringReplaced = jsonString.replace(/Precio Gasoleo A/gi, 'precioGasoleA');
      let jsonFinal = JSON.parse(jsonStringReplaced);
      console.log(jsonFinal);
    });
  }

}
