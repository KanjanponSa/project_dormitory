import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { StudentCostRoutingModule } from './student-cost-routing.module';
import { StudentCostComponent } from './student-cost.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [StudentCostComponent],
  imports: [CommonModule, StudentCostRoutingModule, SharedModule],
})
export class StudentCostModule {}
