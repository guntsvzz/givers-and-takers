// navbar.component.ts
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})

export class NavbarComponent {
  isLoggedIn: boolean = false;
  dropdownOpen = false;
  constructor(private authService: AuthService, private router: Router) {}

  
  ngOnInit() {
    // Subscribe to the login status observable
    this.authService.isLoggedIn$.subscribe((status: boolean) => {
      console.log('Navbar received login status:', status); // Debug log
      this.isLoggedIn = status;
    });
  }

  onLogout() {
    this.authService.logout();
  }

  toggleDropdown() {
    this.dropdownOpen = !this.dropdownOpen;
  }

  onSignOut() {
    this.authService.logout(); // Make sure logout method is implemented in your AuthService
    this.router.navigate(['/auth/login']); // Redirect to login page after sign out
    this.dropdownOpen = false; // Close the dropdown on sign-out
    
    // Redirect to the main page
    this.router.navigate(['/']);
  }
}