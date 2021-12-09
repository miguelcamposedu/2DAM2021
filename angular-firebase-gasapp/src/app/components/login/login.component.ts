import { Component, OnInit } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/compat/auth';
import firebase from 'firebase/compat/app';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(public auth: AngularFireAuth) {
  }

  ngOnInit(): void {
  }

  login() {
    this.auth.signInWithPopup(new firebase.auth.GoogleAuthProvider()).then(resp => {
      console.log(resp);
    });
  }

  logout() {
    this.auth.signOut();
  }

}
