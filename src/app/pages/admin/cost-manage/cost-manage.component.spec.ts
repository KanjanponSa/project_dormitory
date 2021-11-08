import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CostManageComponent } from './cost-manage.component';

describe('CostManageComponent', () => {
  let component: CostManageComponent;
  let fixture: ComponentFixture<CostManageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CostManageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CostManageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
