import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HistoryElectricBillComponent } from './history-electric-bill.component';

describe('HistoryElectricBillComponent', () => {
  let component: HistoryElectricBillComponent;
  let fixture: ComponentFixture<HistoryElectricBillComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HistoryElectricBillComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HistoryElectricBillComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
