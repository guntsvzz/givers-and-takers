// auth.service.ts
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000';
  private isLoggedInSubject = new BehaviorSubject<boolean>(false); // Track login status
  isLoggedIn$ = this.isLoggedInSubject.asObservable();

  constructor(private http: HttpClient) {}

  register(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/users`, { user: userData });
  }

  login(credentials: { email: string; password: string }): Observable<any> {
    return this.http.post(`${this.apiUrl}/users/sign_in`, { user: credentials });
  }

  setLoggedIn(status: boolean) {
    if (status) {
      localStorage.setItem('authToken', 'some-auth-token'); // Replace 'some-auth-token' with the actual token from the response
    } else {
      localStorage.removeItem('authToken');
    }
    this.isLoggedInSubject.next(status);
  }
  
  logout() {
    this.setLoggedIn(false);
  }

  // auth.service.ts
  getAuthHeaders() {
    const token = localStorage.getItem('token');
    return { headers: new HttpHeaders({ Authorization: `Bearer ${token}` }) };
  }

  // Add resetPassword method here
  resetPassword(email: string): Observable<any> {
    const apiUrl = `${this.apiUrl}/reset-password`; // Replace with actual reset password endpoint
    return this.http.post(apiUrl, { email });
  }
}
