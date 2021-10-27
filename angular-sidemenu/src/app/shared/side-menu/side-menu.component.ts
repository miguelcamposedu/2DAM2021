import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-side-menu',
  templateUrl: './side-menu.component.html',
  styleUrls: ['./side-menu.component.css']
})
export class SideMenuComponent implements OnInit {
  currentPage = 'profile';

  constructor(private router: Router) { }

  ngOnInit(): void {
    console.log(this.router.url);
  }

}
