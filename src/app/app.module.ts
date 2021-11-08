import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ScullyLibModule } from '@scullyio/ng-lib';
import { DefaultLayoutComponent } from './components/default-layout/default-layout.component';
import { LayoutModule } from '@angular/cdk/layout';
import { AppService } from './services/app.service';
import { NotfoundComponent } from './components/notfound/notfound.component';
import { SharedModule } from './shared/shared-module';
import { PrivateComponent } from './components/private/private.component';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { CheckLoginGuard } from './guards/check-login.guard';
import { AdminViewGuard } from './guards/admin-view.guard';
import { StudentViewGuard } from './guards/student-view.guard';
import { MAT_DATE_LOCALE } from '@angular/material/core';

export function getBaseUrl() {
  return document.getElementsByTagName('base')[0].href;
}

@NgModule({
  declarations: [
    AppComponent,
    DefaultLayoutComponent,
    NotfoundComponent,
    PrivateComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ScullyLibModule,
    LayoutModule,
    SharedModule,
    MatToolbarModule,
    MatButtonModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
  ],
  providers: [
    { provide: 'BASE_URL', useFactory: getBaseUrl },
    { provide: MAT_DATE_LOCALE, useValue: 'th-TH' },
    AppService,
    CheckLoginGuard,
    AdminViewGuard,
    StudentViewGuard,
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
