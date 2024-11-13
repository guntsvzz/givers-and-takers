import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';  // Import the Home component
import { AboutComponent } from './about/about.component';
import { GiverComponent } from './giver/giver.component';
import { TakerComponent } from './taker/taker.component';
import { SearchComponent } from './search/search.component';

import { SettingsComponent } from './account/settings/settings.component';
import { GiverAccountComponent } from './account/giver/giver.component';
import { TakerAccountComponent } from './account/taker/taker.component';

// Assume AuthModule is lazy-loaded
const routes: Routes = [
  { path: '', component: HomeComponent },            
  { path: 'search', component: SearchComponent },     
  { path: 'giver', component: GiverComponent },   
  { path: 'taker', component: TakerComponent }, 
  { path: 'about', component: AboutComponent },      
  { 
    path: 'auth', 
    loadChildren: () => import('./auth/auth.module').then(m => m.AuthModule) 
  },  
  { path: 'account/settings', component: SettingsComponent },
  { path: 'account/giver', component: GiverAccountComponent },
  { path: 'account/taker', component: TakerAccountComponent },
]
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }


// import { NgModule } from '@angular/core';
// import { RouterModule, Routes } from '@angular/router';
// import { HomeComponent } from './home/home.component';  // Import the Home component
// import { MainLayoutComponent } from './layouts/main-layout/main-layout.component';
// import { AuthLayoutComponent } from './layouts/auth-layout/auth-layout.component';
// import { LoginComponent } from './auth/login/login.component';
// import { SignupComponent } from './auth/signup/signup.component';
// import { ForgotComponent } from './auth/forgot/forgot.component';
// import { AboutComponent } from './about/about.component';

// const routes: Routes = [
//   {
//     path: '',
//     component: MainLayoutComponent,
//     children: [
//       { path: '', component: HomeComponent },
//       { path: 'search', component: HomeComponent },
//       { path: 'donate', component: HomeComponent },
//       { path: 'recipient', component: HomeComponent },
//       { path: 'about', component: AboutComponent },
//       {
//         path: 'auth',
//         loadChildren: () => import('./auth/auth.module').then(m => m.AuthModule),
//       },
//     ],
//   },
//   {
//     path: 'auth',
//     component: AuthLayoutComponent,
//     children: [
//       { path: 'login', component: LoginComponent }, // Replace with your actual Login component
//       { path: 'signup', component: SignupComponent }, // Replace with your actual Signup component
//       { path: 'forgot', component: ForgotComponent }, // Replace with your actual Forgot component
//     ],
//   },
// ];

// @NgModule({
//   imports: [RouterModule.forRoot(routes)],
//   exports: [RouterModule]
// })
// export class AppRoutingModule { }
