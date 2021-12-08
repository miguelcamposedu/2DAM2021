import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { of } from 'rxjs';
import { ListaEESSPrecio } from 'src/app/models/interfaces/gasolineras.interface';
import { MunicipiosResponse } from 'src/app/models/interfaces/municipios.interface';
import { ProvinciasResponse } from 'src/app/models/interfaces/provincias.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';
import {map, startWith} from 'rxjs/operators';

@Component({
  selector: 'app-gasolinera-list',
  templateUrl: './gasolinera-list.component.html',
  styleUrls: ['./gasolinera-list.component.css']
})
export class GasolineraListComponent implements OnInit {
  gasolineraList: ListaEESSPrecio[] = [];
  provinciasList: ProvinciasResponse[] = [];
  provinciaSelected = new FormControl([]);
  provinciaFirstSelected = '';
  municipiosList: MunicipiosResponse[] = [];
  municipioSelected = new FormControl([]);
  municipiosFiltered: MunicipiosResponse[] = [];
  
  constructor(private gasolineraService: GasolineraService) { }

  async ngOnInit(): Promise<void> {
    this.gasolineraService.getGasolineras().subscribe(resp => {
      this.gasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(resp);
      console.log(this.gasolineraList);
    });

    this.gasolineraService.getProvincias().subscribe(resp => {
      this.provinciasList = resp;
    });

    this.municipioSelected.valueChanges.pipe(
      startWith(''),
      map(value => (typeof value === 'string' ? value : value.Municipio)),
      map(name => (name ? this._municipioFilter(name) : this.municipiosList.slice())),
    ).subscribe(resp => {
      this.municipiosFiltered = resp;
    });
  }

  private _municipioFilter(value: string): MunicipiosResponse[] {
    const filterValue = value.toLowerCase();
    let municipios = this.municipiosList.filter(municipio => municipio.Municipio.toLowerCase().includes(filterValue));
    console.log(filterValue, municipios, this.municipiosList);
    return municipios;
  }

  getFirstProvinciaName() {
    return this.provinciasList.find(p => p.IDPovincia == this.provinciaSelected.value[0])?.Provincia;
  }

  onProvinciaChange() {
    this.municipiosFiltered = [];
    let count = 0;
    this.gasolineraService.requestMultipleMunicipioProvincia(this.provinciaSelected.value as String[]).subscribe(
      respuestaPeticionesMunicipios => {
        respuestaPeticionesMunicipios.forEach(resp => {
          count += resp.length;
          this.municipiosFiltered = this.municipiosFiltered.concat(resp);
          this.municipioSelected.setValue('');
        });

        console.log(this.municipiosFiltered.length, count);
      });
  }

  displayFn(municipioId: string): string {
    let municipioFind = this.municipiosList?.find(m => m.IDMunicipio == municipioId);
    return municipioFind && municipioFind.Municipio ? municipioFind.Municipio : '';
  }



}
