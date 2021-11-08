import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ElectricBillRoutingModule } from './electric-bill-routing.module';
import { ElectricBillComponent } from './electric-bill.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [ElectricBillComponent],
  imports: [CommonModule, ElectricBillRoutingModule, SharedModule],
})
export class ElectricBillModule {}
