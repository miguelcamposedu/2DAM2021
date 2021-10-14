import { Component, OnInit } from '@angular/core';
import { ALUMNOS_FAKE } from '../models/fake-models';

export interface Alumno {
  id: string;
  name: string;
  lastName: string;
  age: number;
}

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent implements OnInit {
  displayedColumns: string[] = ['colName', 'colLastName', 'colAge', 'colActions'];
  dataSource = ALUMNOS_FAKE;

  constructor() {
  }

  ngOnInit(): void {
  }

}
