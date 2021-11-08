import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DormitoryListComponent } from './dormitory-list/dormitory-list.component';
import { ElectricListComponent } from './electric-list/electric-list.component';
import { QaListComponent } from './qa-list/qa-list.component';

const routes: Routes = [
  { path: 'dormitory', component: DormitoryListComponent },
  { path: 'electric', component: ElectricListComponent },
  { path: 'qa', component: QaListComponent },
  { path: '', redirectTo: '/home', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class StudentRoutingModule {}
