import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  loginForm: FormGroup;
  forgotPasswordForm: FormGroup;
  showForgotPassword = false;
  showRoleSelection = false;
  showSignUpForm = false;
  selectedRole: string | null = null;

  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private authService: AuthService
  ) {
    // Initialize login form
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required]
    });

    // Initialize forgot password form
    this.forgotPasswordForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]]
    });
  }

  // Toggle between showing the forgot password form and the login form
  toggleForgotPassword() {
    this.showForgotPassword = !this.showForgotPassword;
    this.showRoleSelection = false;
    this.showSignUpForm = false;
  }

  // Toggle between showing role selection and login form
  // toggleRoleSelection() {
  //   this.showRoleSelection = !this.showRoleSelection;
  //   this.showForgotPassword = false;
  //   this.showSignUpForm = false;
  // }
  toggleRoleSelection() {
    this.router.navigate(['/signup']);
  }

  // Handle role selection and show the sign-up form for that role
  selectRole(role: string) {
    this.selectedRole = role;
    this.showSignUpForm = true;
    this.showRoleSelection = false;
    this.showForgotPassword = false;
  }

  // Handle login form submission
  onLogin() {
    if (this.loginForm.valid) {
      this.authService.login(this.loginForm.value).subscribe(
        (response: any) => {
          console.log('Login successful:', response);
          // Check if the response contains a token
          if (response.token) {
            localStorage.setItem('authToken', response.token);
            this.authService.setLoggedIn(true);
            this.router.navigate(['/']); // Navigate to main page or user account page
          } else {
            console.error('No token received in response.');
          }
        },
        (error: any) => {
          console.error('Login error:', error);
          // Show an error message to the user if needed
        }
      );
    } else {
      console.error('Login form is invalid');
    }
  }  
  // Handle forgot password form submission
  onResetPassword() {
    if (this.forgotPasswordForm.valid) {
      const email = this.forgotPasswordForm.value.email;
      this.authService.resetPassword(email).subscribe(
        () => {
          console.log('Password reset instructions sent to:', email);
          this.toggleForgotPassword(); // Return to login after request
        },
        (error: any) => {
          console.error('Error sending reset instructions:', error);
        }
      );
    } else {
      console.error('Forgot Password form is invalid');
    }
  }
  
}
