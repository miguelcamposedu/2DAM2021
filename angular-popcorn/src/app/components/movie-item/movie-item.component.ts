import { Component, Input, OnInit } from '@angular/core';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';

@Component({
  selector: 'app-movie-item',
  templateUrl: './movie-item.component.html',
  styleUrls: ['./movie-item.component.css']
})
export class MovieItemComponent implements OnInit {
  @Input() movieInput!: Movie;

  constructor() { }

  ngOnInit(): void {
  }

}
