import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { StudentRoutingModule } from './student-routing.module';
import { DormitoryListComponent } from './dormitory-list/dormitory-list.component';
import { ElectricListComponent } from './electric-list/electric-list.component';
import { QaListComponent } from './qa-list/qa-list.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [
    DormitoryListComponent,
    ElectricListComponent,
    QaListComponent,
  ],
  imports: [CommonModule, StudentRoutingModule, SharedModule],
})
export class StudentModule {}
