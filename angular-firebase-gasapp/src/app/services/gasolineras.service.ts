import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, forkJoin } from 'rxjs';
import { GasolinerasListResponse } from '../models/interfaces/gasolineras.interface';
import { MunicipiosResponse } from '../models/interfaces/municipios.interface';
import { ProvinciasResponse } from '../models/interfaces/provincias.interface';

@Injectable({
  providedIn: 'root'
})
export class GasolinerasService {

  constructor(private http: HttpClient) { }

  getGasolineras(): Observable<any> {
    return this.http.get<any>('https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/');
  }

  parseAnyToGasolineraListResponse(jsonString: string) {
    let jsonStringReplaced = jsonString.replace(/Precio Gasoleo A/gi, 'precioGasoleA');
    jsonStringReplaced = jsonStringReplaced.replace(/ListaEESSPrecio/gi, 'listaEESSPrecio');
    jsonStringReplaced = jsonStringReplaced.replace(/Dirección/gi, 'direccion');
    jsonStringReplaced = jsonStringReplaced.replace(/Rótulo/gi, 'rotulo');
    jsonStringReplaced = jsonStringReplaced.replace(/IDEESS/gi, 'ideess');
    let jsonFinal: GasolinerasListResponse = JSON.parse(jsonStringReplaced);
    return jsonFinal.listaEESSPrecio;
  }

  getProvincias(): Observable<ProvinciasResponse[]> {
    return this.http.get<ProvinciasResponse[]>('https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/Listados/Provincias/');
  }

  getMunicipiosByProvinciaId(provinciaId: String): Observable<MunicipiosResponse[]> {
    return this.http.get<MunicipiosResponse[]>(`https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/Listados/MunicipiosPorProvincia/${provinciaId}`);
  }

  public requestMultipleMunicipioProvincia(provinciasIds: String[]): Observable<MunicipiosResponse[][]> {
    let responseMunicipios: Observable<MunicipiosResponse[]>[] = [];
    provinciasIds.forEach(pId => {
      responseMunicipios.push(this.getMunicipiosByProvinciaId(pId));
    });
    return forkJoin(responseMunicipios);
  }
}
