import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CostOverdueRoutingModule } from './cost-overdue-routing.module';
import { CostOverdueComponent } from './cost-overdue.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [CostOverdueComponent],
  imports: [CommonModule, CostOverdueRoutingModule, SharedModule],
})
export class CostOverdueModule {}
