import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from './src/environments/environment';  // Assuming environment is configured

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = `${environment.apiUrl}`;
  private isLoggedInSubject = new BehaviorSubject<boolean>(false); // Track login status
  isLoggedIn$ = this.isLoggedInSubject.asObservable();

  constructor(private http: HttpClient) {
    // Check if the user is logged in based on the presence of a token in localStorage
    const token = localStorage.getItem('authToken');
    this.isLoggedInSubject.next(!!token); // If token exists, set to true
  }

  register(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/users`, { user: userData });
  }

  login(credentials: { email: string; password: string }): Observable<any> {
    return this.http.post(`${this.apiUrl}/users/sign_in`, { user: credentials });
  }

  // Set login status and store token in localStorage
  setLoggedIn(status: boolean, token: string | null = null) {
    if (status) {
      // Store the token in localStorage
      if (token) {
        localStorage.setItem('authToken', token);
      }
    } else {
      // Remove the token from localStorage
      localStorage.removeItem('authToken');
    }
    this.isLoggedInSubject.next(status);
  }

  // Log out the user
  logout() {
    this.setLoggedIn(false);
  }

  // Retrieve the auth token from localStorage
  getAuthToken(): string | null {
    return localStorage.getItem('authToken');
  }

  // Generate headers for HTTP requests that require authentication
  getAuthHeaders(): { headers: HttpHeaders } {
    const token = this.getAuthToken();
    return { headers: new HttpHeaders({ Authorization: `Bearer ${token}` }) };
  }

  // Add resetPassword method
  resetPassword(email: string): Observable<any> {
    const apiUrl = `${this.apiUrl}/reset-password`; // Replace with actual reset password endpoint
    return this.http.post(apiUrl, { email });
  }
}
