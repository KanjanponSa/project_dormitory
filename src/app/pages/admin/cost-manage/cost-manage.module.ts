import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CostManageRoutingModule } from './cost-manage-routing.module';
import { CostManageComponent } from './cost-manage.component';
import { FanComponent } from './fan/fan.component';
import { AirComponent } from './air/air.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [CostManageComponent, FanComponent, AirComponent],
  imports: [CommonModule, CostManageRoutingModule, SharedModule],
})
export class CostManageModule {}
