import { AppService } from 'src/app/services/app.service';
import { Injectable } from '@angular/core';
import {
  CanActivate,
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
} from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class StudentViewGuard implements CanActivate {
  constructor(private service: AppService) {}

  canActivate(next: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    if (this.service.getUserLogin()['role'] == 'student') {
      return true;
    }
    this.service.showAlert('', 'ไม่ได้รับอนุญาติให้เข้าใช้งาน', 'error');
    this.service.navRouter('/home');
    return false;
  }
}
