import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.scss']
})
export class SearchComponent implements OnInit {
  requests: any[] = [];

  ngOnInit(): void {
    this.generateFakeRequests();
  }

  // Generate 13 fake requests
  generateFakeRequests(): void {
    this.requests = Array.from({ length: 13 }, (_, i) => ({
      id: i + 1,
      title: `Request Title ${i + 1}`,
      description: `This is a description for request ${i + 1}.`,
      imageUrl: `../assets/school.jpg`, // Using 3 sample images
      organizer: `Organizer ${i + 1}`
    }));
  }
}
