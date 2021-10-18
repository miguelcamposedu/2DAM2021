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
  displayedOriginalColumns: string[] = ['colName', 'colLastName', 'colAge', 'colActions'];
  displayedColumns: string[] = ['colName', 'colLastName', 'colAge', 'colActions'];
  dataSource = ALUMNOS_FAKE;
  name = '';

  constructor() {
  }

  ngOnInit(): void {
  }

  checkboxChange(isChecked: boolean, columnName: string) {
    if(isChecked) {
      this.displayedColumns.splice(this.displayedOriginalColumns.indexOf(columnName), 0, columnName);
    } else {
      this.displayedColumns.splice(this.displayedColumns.indexOf(columnName), 1);
    }
    console.log(this.displayedColumns);
  }

  enviar() {
    console.log(this.name);
  }

}


