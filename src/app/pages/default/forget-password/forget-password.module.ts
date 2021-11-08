import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ForgetPasswordRoutingModule } from './forget-password-routing.module';
import { ForgetPasswordComponent } from './forget-password.component';
import { SharedModule } from 'src/app/shared/shared-module';

@NgModule({
  declarations: [ForgetPasswordComponent],
  imports: [CommonModule, ForgetPasswordRoutingModule, SharedModule],
})
export class ForgetPasswordModule {}
