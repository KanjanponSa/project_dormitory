import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CostSummaryRoutingModule } from './cost-summary-routing.module';
import { CostSummaryComponent } from './cost-summary.component';
import { SharedModule } from 'src/app/shared/shared-module';
import { DormitoryComponent } from './dormitory/dormitory.component';
import { ElectricComponent } from './electric/electric.component';

@NgModule({
  declarations: [CostSummaryComponent, DormitoryComponent, ElectricComponent],
  imports: [CommonModule, CostSummaryRoutingModule, SharedModule],
})
export class CostSummaryModule {}
