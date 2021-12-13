import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { GasolinerasFavListComponent } from './components/gasolineras-fav-list/gasolineras-fav-list.component';
import { GasolinerasListComponent } from './components/gasolineras-list/gasolineras-list.component';
import { LoginComponent } from './components/login/login.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', component: LoginComponent },
  { path: 'login', pathMatch: 'full', redirectTo: '/login' },
  { path: 'gasolineras', pathMatch: 'full', component: GasolinerasListComponent },
  { path: 'gasolineras-fav', pathMatch: 'full', component: GasolinerasFavListComponent }, 
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
