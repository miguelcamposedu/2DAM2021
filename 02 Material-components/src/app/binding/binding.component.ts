import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-binding',
  templateUrl: './binding.component.html',
  styleUrls: ['./binding.component.css']
})
export class BindingComponent implements OnInit {
  urlPhoto = 'https://estaticos-cdn.sport.es/clip/57b4defe-a487-4d9d-a9d5-4034b12575dc_alta-libre-aspect-ratio_default_0.jpg';
  nombre = 'Miguel';

  constructor() { }

  ngOnInit(): void {
  }

  getUrlPath(player: string) {
    if(player == 'Ronaldo') {
      return 'https://estaticos-cdn.sport.es/clip/57b4defe-a487-4d9d-a9d5-4034b12575dc_alta-libre-aspect-ratio_default_0.jpg';
    } else {
      return 'https://s.france24.com/media/display/9423a814-f832-11eb-adc8-005056a90284/w:1280/p:16x9/messi%20bye.jpg';
    }
  }

  saveForm() {
    alert('Nombre guardado: ' + this.nombre);
  }

}
