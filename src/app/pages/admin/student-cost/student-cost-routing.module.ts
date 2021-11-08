import { StudentCostComponent } from './student-cost.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    component: StudentCostComponent,
    children: [
      {
        path: 'dormitory',
        loadChildren: () =>
          import('./dormitory/dormitory.module').then((m) => m.DormitoryModule),
      },
      {
        path: 'electric',
        loadChildren: () =>
          import('./electric/electric.module').then((m) => m.ElectricModule),
      },
      { path: '', redirectTo: '/student-cost/dormitory', pathMatch: 'full' },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class StudentCostRoutingModule {}
