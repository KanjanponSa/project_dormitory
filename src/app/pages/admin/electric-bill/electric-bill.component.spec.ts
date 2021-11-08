import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ElectricBillComponent } from './electric-bill.component';

describe('ElectricBillComponent', () => {
  let component: ElectricBillComponent;
  let fixture: ComponentFixture<ElectricBillComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ElectricBillComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ElectricBillComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
