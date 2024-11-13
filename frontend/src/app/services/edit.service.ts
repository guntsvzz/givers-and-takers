import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from './src/environments/environment';  // 

@Injectable({
  providedIn: 'root'
})
export class EditService {
  private apiUrl = `${environment.apiUrl}/users/edit`;

  constructor(private http: HttpClient) {}

  getUserData(): Observable<any> {
    return this.http.get<any>(this.apiUrl);
  }
}
