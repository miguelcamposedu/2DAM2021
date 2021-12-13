import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { startWith, map } from 'rxjs';
import { ListaEESSPrecio } from 'src/app/models/interfaces/gasolineras.interface';
import { MunicipiosResponse } from 'src/app/models/interfaces/municipios.interface';
import { ProvinciasResponse } from 'src/app/models/interfaces/provincias.interface';
import { GasolinerasService } from 'src/app/services/gasolineras.service';

@Component({
  selector: 'app-gasolineras-list',
  templateUrl: './gasolineras-list.component.html',
  styleUrls: ['./gasolineras-list.component.css']
})
export class GasolinerasListComponent implements OnInit {

gasolineraList: ListaEESSPrecio[] = [];
  provinciasList: ProvinciasResponse[] = [];
  provinciaSelected = new FormControl([]);
  provinciaFirstSelected = '';
  municipiosList: MunicipiosResponse[] = [];
  municipioSelected = new FormControl([]);
  municipiosFiltered: MunicipiosResponse[] = [];
  
  constructor(private gasolineraService: GasolinerasService) { }

  async ngOnInit(): Promise<void> {
    this.gasolineraService.getGasolineras().subscribe(resp => {
      let jsonString = JSON.stringify(resp);
      this.gasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(jsonString);
      console.log(this.gasolineraList);
    });

    this.gasolineraService.getProvincias().subscribe(resp => {
      this.provinciasList = resp;
    });

  }

}
