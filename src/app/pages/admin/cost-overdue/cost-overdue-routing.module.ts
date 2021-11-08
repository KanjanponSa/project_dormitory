import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CostOverdueComponent } from './cost-overdue.component';

const routes: Routes = [{ path: '', component: CostOverdueComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class CostOverdueRoutingModule {}
