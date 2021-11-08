import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UsermanagerRoutingModule } from './usermanager-routing.module';
import { UsermanagerComponent } from './usermanager.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [UsermanagerComponent],
  imports: [CommonModule, UsermanagerRoutingModule, SharedModule],
})
export class UsermanagerModule {}
