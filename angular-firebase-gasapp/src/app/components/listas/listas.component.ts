import { Component, OnInit } from '@angular/core';
import { map } from 'rxjs';
import ListaFirebaseDto from 'src/app/models/interfaces/listas-firebase.dto';
import { ListasFirebaseService } from 'src/app/services/listas-firebase.service';

@Component({
  selector: 'app-listas',
  templateUrl: './listas.component.html',
  styleUrls: ['./listas.component.css']
})
export class ListasComponent implements OnInit {
  listasList!: ListaFirebaseDto[];

  constructor(private listasFirebaseService: ListasFirebaseService) { }

  ngOnInit(): void {
    this.getAllLists();
  }

  getAllLists(): void {
    this.listasFirebaseService.getAll().snapshotChanges().pipe(
      map(changes =>
        changes.map(c =>
          ({ id: c.payload.doc.id, ...c.payload.doc.data() })
        )
      )
    ).subscribe(data => {
      this.listasList = data;
    });
  }

}
