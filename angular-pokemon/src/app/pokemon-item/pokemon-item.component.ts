import { Component, Input, OnInit } from '@angular/core';
import { Pokemon } from '../interfaces/pokemon-list.interface';

@Component({
  selector: 'app-pokemon-item',
  templateUrl: './pokemon-item.component.html',
  styleUrls: ['./pokemon-item.component.css']
})
export class PokemonItemComponent implements OnInit {
  @Input() pokemonInput: Pokemon | undefined;
  i: number = 0;

  constructor() { }

  ngOnInit(): void {
  }

  getPokemonPhotoUrl(url: string | undefined): string {
    if(url) {
      let splitArray = url.split("/");
      console.log(splitArray);
      return `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${splitArray[6]}.png`;
    } else {
      return '';
    }
  }

}
