import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DormitoryListComponent } from './dormitory-list.component';

describe('DormitoryListComponent', () => {
  let component: DormitoryListComponent;
  let fixture: ComponentFixture<DormitoryListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DormitoryListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DormitoryListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
