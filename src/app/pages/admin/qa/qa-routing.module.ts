import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { QaComponent } from './qa.component';

const routes: Routes = [{ path: '', component: QaComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class QaRoutingModule {}
