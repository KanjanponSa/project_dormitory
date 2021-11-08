import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CostSummaryComponent } from './cost-summary.component';
import { DormitoryComponent } from './dormitory/dormitory.component';
import { ElectricComponent } from './electric/electric.component';

const routes: Routes = [
  {
    path: '',
    component: CostSummaryComponent,
    children: [
      { path: 'dormitory', component: DormitoryComponent },
      { path: 'electric', component: ElectricComponent },
      { path: '', redirectTo: '/cost-summary/dormitory', pathMatch: 'full' },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class CostSummaryRoutingModule {}
