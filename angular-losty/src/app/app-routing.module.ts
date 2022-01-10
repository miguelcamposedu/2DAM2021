import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MapaComponent } from './components/mapa/mapa.component';
import { PrivateComponent } from './pages/private/private.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', component: MapaComponent},
  { path: 'private', component: PrivateComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
