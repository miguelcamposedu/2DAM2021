import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PokemonListResponse } from '../interfaces/pokemon-list.interface';

const API_BASE_URL = 'https://pokeapi.co/api/v2';

@Injectable({
  providedIn: 'root'
})
export class PokemonService {
  limit = 100;

  constructor(private http: HttpClient) { }

  getPokemonList(): Observable<PokemonListResponse> {
    return this.http.get<PokemonListResponse>(`${API_BASE_URL}/pokemon?limit=${this.limit}`);
  }

}
