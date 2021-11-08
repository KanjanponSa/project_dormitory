import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HistoryElectricBillRoutingModule } from './history-electric-bill-routing.module';
import { HistoryElectricBillComponent } from './history-electric-bill.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [HistoryElectricBillComponent],
  imports: [CommonModule, HistoryElectricBillRoutingModule, SharedModule],
})
export class HistoryElectricBillModule {}
