import { CostManageComponent } from './cost-manage.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FanComponent } from './fan/fan.component';
import { AirComponent } from './air/air.component';

const routes: Routes = [
  {
    path: '',
    component: CostManageComponent,
    children: [
      {
        path: 'fan',
        component: FanComponent,
      },
      {
        path: 'air',
        component: AirComponent,
      },
      {
        path: '',
        redirectTo: '/cost-manage/fan',
        pathMatch: 'full',
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class CostManageRoutingModule {}
