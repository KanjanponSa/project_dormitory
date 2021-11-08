import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentCostComponent } from './student-cost.component';

describe('StudentCostComponent', () => {
  let component: StudentCostComponent;
  let fixture: ComponentFixture<StudentCostComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StudentCostComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StudentCostComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
