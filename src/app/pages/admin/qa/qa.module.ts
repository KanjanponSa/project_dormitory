import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { QaRoutingModule } from './qa-routing.module';
import { QaComponent } from './qa.component';


@NgModule({
  declarations: [QaComponent],
  imports: [
    CommonModule,
    QaRoutingModule
  ]
})
export class QaModule { }
