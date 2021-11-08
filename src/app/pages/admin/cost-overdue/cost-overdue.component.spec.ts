import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CostOverdueComponent } from './cost-overdue.component';

describe('CostOverdueComponent', () => {
  let component: CostOverdueComponent;
  let fixture: ComponentFixture<CostOverdueComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CostOverdueComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CostOverdueComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
