import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { PokemonResponse } from 'src/app/interfaces/pokemon.interface';
import { PokemonService } from 'src/app/services/pokemon.service';

export interface DialogPokemonDetailData {
  pokemonName: string;
}


@Component({
  selector: 'app-dialog-pokemon-detail',
  templateUrl: './dialog-pokemon-detail.component.html',
  styleUrls: ['./dialog-pokemon-detail.component.css']
})
export class DialogPokemonDetailComponent implements OnInit {
  pokemon!: PokemonResponse;

  constructor(
    @Inject(MAT_DIALOG_DATA) private data: DialogPokemonDetailData,
    private pokemonService: PokemonService) { }

  ngOnInit(): void {
    console.log(this.data.pokemonName);
    this.pokemonService.getPokemon(this.data.pokemonName).subscribe(pokemonResult => {
      this.pokemon = pokemonResult;
    });
  }

  getPokemonImg(): string {
    return `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${this.pokemon.id}.png`;
  }

}
