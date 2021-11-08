import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HistoryElectricBillComponent } from './history-electric-bill.component';

const routes: Routes = [{ path: '', component: HistoryElectricBillComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class HistoryElectricBillRoutingModule {}
