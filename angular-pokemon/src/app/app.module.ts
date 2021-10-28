import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { PokemonListComponent } from './pokemon-list/pokemon-list.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialImportsModule } from './modules/material-imports.module';
import { FormsModule } from '@angular/forms';
import { PokemonItemComponent } from './pokemon-item/pokemon-item.component';
import { DialogPokemonDetailComponent } from './dialogs/dialog-pokemon-detail/dialog-pokemon-detail.component';

@NgModule({
  declarations: [
    AppComponent,
    PokemonListComponent,
    PokemonItemComponent,
    DialogPokemonDetailComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    BrowserAnimationsModule,
    MaterialImportsModule,
    FormsModule
  ],
  entryComponents: [
    DialogPokemonDetailComponent
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
