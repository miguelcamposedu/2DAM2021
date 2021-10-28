import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SideMenuComponent } from './shared/side-menu/side-menu.component';
import { MaterialImportsModule } from './modules/material-imports.module';
import { MoviesListComponent } from './pages/movies-list/movies-list.component';
import { PeopleListComponent } from './pages/people-list/people-list.component';
import { MyProfileComponent } from './pages/my-profile/my-profile.component';
import { DialogMovieNewComponent } from './dialogs/dialog-movie-new/dialog-movie-new.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent,
    SideMenuComponent,
    MoviesListComponent,
    PeopleListComponent,
    MyProfileComponent,
    DialogMovieNewComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialImportsModule,
    FormsModule,
    HttpClientModule
  ],
  entryComponents: [
    DialogMovieNewComponent
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
