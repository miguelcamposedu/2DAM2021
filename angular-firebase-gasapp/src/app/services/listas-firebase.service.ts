import { Injectable } from '@angular/core';
import { AngularFirestore, AngularFirestoreCollection } from '@angular/fire/compat/firestore';
import ListaFirebaseDto from '../models/interfaces/listas-firebase.dto';

@Injectable({
  providedIn: 'root'
})
export class ListasFirebaseService {

  listasRef!: AngularFirestoreCollection<ListaFirebaseDto>;

  constructor(private firestore: AngularFirestore) {
    let userId = localStorage.getItem('uid');
    this.listasRef = this.firestore.collection(`users/${userId}/listas`);
  }

  getAll(): AngularFirestoreCollection<ListaFirebaseDto> {
    return this.listasRef;
  }
}
