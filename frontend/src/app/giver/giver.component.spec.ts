import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GiverComponent } from './giver.component';

describe('GiverComponent', () => {
  let component: GiverComponent;
  let fixture: ComponentFixture<GiverComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [GiverComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(GiverComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
