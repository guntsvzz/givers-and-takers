import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; 

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { HomeComponent } from './home/home.component';
import { NavbarComponent } from './navbar/navbar.component';
import { AboutComponent } from './about/about.component';
import { GiverComponent } from './giver/giver.component';
import { TakerComponent } from './taker/taker.component';
import { SearchComponent } from './search/search.component';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { FormsModule } from '@angular/forms';
import { SignupComponent } from './auth/signup/signup.component';
import { AuthModule } from './auth/auth.module';
import { FooterComponent } from './footer/footer.component';
@NgModule({
  declarations: [
    AppComponent,
    HomeComponent, 
    NavbarComponent,
    AboutComponent,
    GiverComponent,
    TakerComponent,
    SearchComponent,
    FooterComponent,
    // SignupComponent
  ],
  imports: [
    FormsModule,
    AppRoutingModule,
    AuthModule,
    BrowserModule,
    HttpClientModule
  ],
  providers: [
    provideAnimationsAsync()
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
