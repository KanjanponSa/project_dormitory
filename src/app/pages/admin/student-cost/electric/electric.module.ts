import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ElectricRoutingModule } from './electric-routing.module';
import { ElectricComponent } from './electric.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [ElectricComponent],
  imports: [CommonModule, ElectricRoutingModule, SharedModule],
})
export class ElectricModule {}
