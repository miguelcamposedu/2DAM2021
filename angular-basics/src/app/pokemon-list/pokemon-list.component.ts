import { Component, OnInit } from '@angular/core';
import { PokemonListResponse } from '../interfaces/pokemon-list.interface';
import { PokemonService } from '../services/pokemon.service';

@Component({
  selector: 'app-pokemon-list',
  templateUrl: './pokemon-list.component.html',
  styleUrls: ['./pokemon-list.component.css']
})
export class PokemonListComponent implements OnInit {
  pokemonList: PokemonListResponse | undefined;

  constructor(private pokemonService: PokemonService) {}

  ngOnInit(): void {
    this.pokemonService.getPokemonList().subscribe( resultado => {
      console.log(resultado);
    });
  }

}
