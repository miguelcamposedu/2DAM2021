import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-custom-toolbar',
  templateUrl: './custom-toolbar.component.html',
  styleUrls: ['./custom-toolbar.component.css']
})
export class CustomToolbarComponent implements OnInit {
  urlLogo = '';

  constructor() { }

  ngOnInit(): void {
    this.urlLogo = '../../assets/images/logo.svg';
  }

}
