import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DormitoryRoutingModule } from './dormitory-routing.module';
import { DormitoryComponent } from './dormitory.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [DormitoryComponent],
  imports: [CommonModule, DormitoryRoutingModule, SharedModule],
})
export class DormitoryModule {}
