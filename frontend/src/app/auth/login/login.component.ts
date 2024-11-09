import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})

export class LoginComponent {
  constructor(private router: Router) {}

  showForgotPassword: boolean = false;
  showRoleSelection: boolean = false;
  showSignUpForm: boolean = false;
  selectedRole: string | null = null;

  toggleForgotPassword() {
    this.showForgotPassword = !this.showForgotPassword;
    this.showRoleSelection = false;
    this.showSignUpForm = false;
  }

  toggleRoleSelection() {
    this.showRoleSelection = !this.showRoleSelection;
    this.showForgotPassword = false;
    this.showSignUpForm = false;
  }

  selectRole(role: string) {
    this.selectedRole = role;
    this.showSignUpForm = true;
    this.showRoleSelection = false;
    this.showForgotPassword = false;
  }
  // Navigate to the Forgot Password page
  // goToForgotPassword() {
  //   this.router.navigate(['/forgot']);
  // }

  // // Navigate to the Sign Up page
  // goToSignUp() {
  //   this.router.navigate(['/signup']);
  // }
}
