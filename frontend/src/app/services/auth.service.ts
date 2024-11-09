// auth.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/users';  // Updated to match the correct registration path

  constructor(private http: HttpClient) {}

  // register(userData: any): Observable<any> {
  //   return this.http.post(this.apiUrl, { user: userData });
  // }
  // auth.service.ts
  register(userData: any): Observable<any> {
    return this.http.post(this.apiUrl, { user: userData }, { headers: { 'Content-Type': 'application/json' } });
  }
}
