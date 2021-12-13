import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import { firestoreInstanceFactory } from '@angular/fire/firestore/firestore.module';
import { ListaEESSPrecio } from '../models/interfaces/gasolineras.interface';

@Injectable({
  providedIn: 'root'
})
export class GasolinerasFirebaseService {

  constructor(private firestore: AngularFirestore) { }

  addFavorite(gasolinera: ListaEESSPrecio) {
    let userId = localStorage.getItem('uid');
    return this.firestore.collection(`users/${userId}/favorites`).doc(gasolinera.ideess).set({
      id: gasolinera.ideess,
      direccion: gasolinera.direccion,
      rotulo: gasolinera.rotulo,
      uid: localStorage.getItem('uid')
    });
  }
}
