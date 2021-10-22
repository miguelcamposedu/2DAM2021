import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-student-detail',
  templateUrl: './student-detail.component.html',
  styleUrls: ['./student-detail.component.css']
})
export class StudentDetailComponent implements OnInit {

  constructor(private route: ActivatedRoute,) { }

  ngOnInit(): void {
    // Query params
    /*this.route.queryParams.subscribe(parametrosUrl => {
      console.log(parametrosUrl);
    });
    */
   debugger;
   let id = this.route.snapshot.paramMap.get('idStudent');
   console.log(id);
  }

}
