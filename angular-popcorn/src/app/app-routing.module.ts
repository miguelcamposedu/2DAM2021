import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MoviesPopularListComponent } from './components/movies-popular-list/movies-popular-list.component';

const routes: Routes = [
  {path: '', component: MoviesPopularListComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
