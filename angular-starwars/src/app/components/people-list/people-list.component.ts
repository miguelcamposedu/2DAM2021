import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { People } from 'src/app/models/interfaces/people.interface';
import { PeopleService } from 'src/app/services/people.service';

@Component({
  selector: 'app-people-list',
  templateUrl: './people-list.component.html',
  styleUrls: ['./people-list.component.css']
})
export class PeopleListComponent implements OnInit {
  listaPersonajes: People[] = [];
  listaPersonajesFiltrados: People[] = [];
  genderFormControl = new FormControl('');

  constructor(private peopleService: PeopleService) { }

  ngOnInit(): void {
    this.genderFormControl.setValue('male');
    this.peopleService.getPeople().subscribe(resp =>  {
      this.listaPersonajes = resp.results;
      this.listaPersonajesFiltrados = this.listaPersonajes;
    });
  }

  doFilter() {
    let genderSelected = this.genderFormControl.value;
    this.listaPersonajesFiltrados = this.listaPersonajes.filter(p => p.gender == genderSelected);
  }

  getPhotoUrl(p: People) {
    let personId = p.url.split('/')[5];
    return `https://starwars-visualguide.com/assets/img/characters/${personId}.jpg`;
  }

}
