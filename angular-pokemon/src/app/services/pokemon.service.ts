import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PokemonListResponse } from '../interfaces/pokemon-list.interface';
import { PokemonResponse } from '../interfaces/pokemon.interface';

const API_BASE_URL = 'https://pokeapi.co/api/v2';

@Injectable({
  providedIn: 'root'
})
export class PokemonService {

  constructor(private http: HttpClient) { }

  getPokemonList(limit: number): Observable<PokemonListResponse> {
    return this.http.get<PokemonListResponse>(`${API_BASE_URL}/pokemon?limit=${limit}`);
  }

  getPokemon(name: string) {
    return this.http.get<PokemonResponse>(`${API_BASE_URL}/pokemon/${name}`);
  }

}
