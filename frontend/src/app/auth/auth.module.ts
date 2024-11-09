import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AuthRoutingModule } from './auth-routing.module';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';
import { ForgotComponent } from './forgot/forgot.component';


@NgModule({
  declarations: [
    LoginComponent,
    SignupComponent,
    ForgotComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    AuthRoutingModule,
    ReactiveFormsModule
  ],
  // exports: [
  //   LoginComponent,
  //   SignupComponent,
  //   ForgotComponent
  // ]
})
export class AuthModule { }
