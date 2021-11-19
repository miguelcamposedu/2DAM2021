import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MoviesPopularListComponent } from './components/movies-popular-list/movies-popular-list.component';
import { SessionComponent } from './shared/session/session.component';

const routes: Routes = [
  {path: 'popular-movies', component: MoviesPopularListComponent},
  {path: 'loginsuccess', component: SessionComponent},
  {path: '', pathMatch: 'full', component: MoviesPopularListComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
