import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MoviesListComponent } from './pages/movies-list/movies-list.component';
import { MyProfileComponent } from './pages/my-profile/my-profile.component';
import { PeopleListComponent } from './pages/people-list/people-list.component';

const routes: Routes = [
  { path: 'movies', component: MoviesListComponent },
  { path: 'people', component: PeopleListComponent },
  { path: 'profile', component: MyProfileComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
