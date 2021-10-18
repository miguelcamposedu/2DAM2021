import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { CustomToolbarComponent } from './custom-toolbar/custom-toolbar.component';


import { StudentListComponent } from './student-list/student-list.component';
import { BindingComponent } from './binding/binding.component';
import { FormsModule } from '@angular/forms';
import { MaterialImportsModule } from './material-imports.module';

@NgModule({
  declarations: [
    AppComponent,
    CustomToolbarComponent,
    StudentListComponent,
    BindingComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    MaterialImportsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
