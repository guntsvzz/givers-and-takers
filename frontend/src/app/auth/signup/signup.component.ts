import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent implements OnInit {
  signupForm!: FormGroup;
  showRoleSelection = true;
  selectedRole: 'donator' | 'recipient' | null = null;

  // Define mappings for role and organization type
  roleMapping = { admin: 0, giver: 1, taker: 2 };
  organizationTypeMapping = { non_profit: 0, educational: 1, other: 2, corporate: 3, government: 4 };

  constructor(
    private formBuilder: FormBuilder,
    private router: Router,
    public authService: AuthService
  ) {}

  ngOnInit() {
    this.signupForm = this.formBuilder.group({
      first_name: ['', Validators.required],
      last_name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      phone_number: ['', Validators.required],
      address: ['', Validators.required],
      organization_name: ['', Validators.required],
      organization_type: ['', Validators.required],  // Dropdown field for organization type
      role: [this.selectedRole, Validators.required]  // Role field
    });
  }

  selectRole(role: 'donator' | 'recipient') {
    this.selectedRole = role;
    this.showRoleSelection = false;
    const roleValue = role === 'donator' ? this.roleMapping['giver'] : this.roleMapping['taker'];
    this.signupForm.get('role')?.setValue(roleValue);  // Set the numeric role value
  }

  onSubmit() {
    if (this.signupForm.valid) {
      // Convert organizationType to its numeric value before submission
      const formData = this.signupForm.value;
  
      // Use type assertion to ensure TypeScript understands the type of organizationType
      formData.organization_type = this.organizationTypeMapping[formData.organization_type as keyof typeof this.organizationTypeMapping];
  
      // Register the user
      this.authService.register(formData).subscribe(
        (response: any) => {
          console.log('Registration successful:', response);

          // After registration, directly log the user in
          this.authService.login({
            email: formData.email,
            password: formData.password
          }).subscribe(
            (loginResponse: any) => {
              console.log('Login successful:', loginResponse);
              // Save the token and navigate to the dashboard or home page
              localStorage.setItem('authToken', loginResponse.token);
              this.authService.setLoggedIn(true);
              this.router.navigate(['/']);
            },
            (loginError: any) => {
              console.error('Login error:', loginError);
              // Optionally handle login failure after signup
            }
          );
        },
        (error: any) => {
          console.error('Registration error:', error);
        }
      );
    } else {
      console.error('Form is invalid');
    }
  }
}
