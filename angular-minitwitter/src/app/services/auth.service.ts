import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

const AUTH_BASE_URL = 'auth';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  authBaseUrl = `${environment.apiBaseUrl}/${AUTH_BASE_URL}`;

  constructor(private http: HttpClient) { }

  login() {
    let requestUrl = `${this.authBaseUrl}/login`;
  }

  forgot() {
    let requestUrl = `${this.authBaseUrl}/forgot`;    
  }

}
