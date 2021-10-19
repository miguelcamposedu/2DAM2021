import { Component, OnInit } from '@angular/core';
import { AuthLoginDto } from '../models/dto/auth.dto';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginDto = new AuthLoginDto();

  constructor(private authService: AuthService) { }

  ngOnInit(): void {
  }

  doLogin() {
    this.authService.login(this.loginDto).subscribe(loginResult => {
      alert(`Te has logueado y tu token es ${loginResult.token}`)
    });
  }

}
