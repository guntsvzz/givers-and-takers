// src/app/services/taker.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TakerService {
  private apiUrl = 'http://localhost:3500/user/2'; // Your backend API URL

  constructor(private http: HttpClient) {}

  getTakers(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }
}
