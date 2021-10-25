import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

const ejemploBaseUrl = `${environment.apiBaseUrl}/ejemplo`;

@Injectable({
  providedIn: 'root'
})
export class EjemploService {

  constructor() { }

  getAlgo() {
    let url = `${ejemploBaseUrl}/popular?api_key=${environment.apiKey}`;
  }

  getOtraCosa() {
    let url = `${ejemploBaseUrl}/details?api_key=${environment.apiKey}`;
  }
}
