import { Component, OnInit } from '@angular/core';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { Observable } from 'rxjs';
import { map, shareReplay } from 'rxjs/operators';
import { AppService } from 'src/app/services/app.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-private',
  templateUrl: './private.component.html',
  styleUrls: ['./private.component.scss'],
})
export class PrivateComponent implements OnInit {
  public isHandset$: Observable<boolean> = this.breakpointObserver
    .observe(Breakpoints.Handset)
    .pipe(
      map((result) => result.matches),
      shareReplay()
    );

  public menuList: Array<{ icon: string; name: string; path: string }> = [];

  constructor(
    private breakpointObserver: BreakpointObserver,
    public service: AppService
  ) {}

  private scrollFunction = (event: any) => {
    var mybutton = document.getElementById('myBtn');

    if (event.target.scrollTop > 40 || event.srcElement.scrollTop > 40) {
      mybutton.style.display = 'block';
    } else {
      mybutton.style.display = 'none';
    }
  };

  public topFunction() {
    let top = document.getElementById('sidenav-private');
    top.scrollTo(0, 0);
  }

  ngOnInit() {
    let top = document.getElementById('sidenav-private');
    top.addEventListener('scroll', this.scrollFunction, true);

    if (this.service.getUserLogin()['role'] == 'admin') {
      // เมนู Admin
      if (this.service.getUserLogin()['type_id'] == '1') {
        this.menuList = [
          {
            icon: 'fas fa-user-tag',
            name: 'ค่าใช้จ่ายของนักศึกษา',
            path: '/student-cost',
          },
          {
            icon: 'fas fa-dollar-sign',
            name: 'จัดการรายการค่าใช้จ่าย',
            path: '/cost-manage',
          },
          {
            icon: 'fas fa-clipboard',
            name: 'บันทึกค่ามิเตอร์ไฟฟ้า',
            path: '/electric-bill',
          },
          {
            icon: 'fas fa-file-medical-alt',
            name: 'ประวัติค่ามิเตอร์ไฟฟ้า',
            path: '/history-electric-bill',
          },
          {
            icon: 'fas fa-edit',
            name: 'สรุปค่าใช้จ่ายประจำวัน',
            path: '/cost-summary',
          },
          {
            icon: 'fas fa-file-alt',
            name: 'รายงานนักศึกษาที่ค้างชำระ',
            path: '/cost-overdue',
          },
          // {
          //   icon: 'fas fa-quote-right',
          //   name: 'คำถามที่พบบ่อย',
          //   path: '/qa',
          // },
          {
            icon: 'fas fa-users-cog',
            name: 'จัดการบัญชีผู้ใช้',
            path: '/usermanager',
          },
        ];
      } else if (this.service.getUserLogin()['type_id'] == '2') {
        this.menuList = [
          {
            icon: 'fas fa-user-tag',
            name: 'ค่าใช้จ่ายของนักศึกษา',
            path: '/student-cost',
          },
          {
            icon: 'fas fa-dollar-sign',
            name: 'จัดการรายการค่าใช้จ่าย',
            path: '/cost-manage',
          },
          {
            icon: 'fas fa-edit',
            name: 'สรุปค่าใช้จ่ายประจำวัน',
            path: '/cost-summary',
          },
          // {
          //   icon: 'fas fa-quote-right',
          //   name: 'คำถามที่พบบ่อย',
          //   path: '/qa',
          // },
        ];
      } else if (this.service.getUserLogin()['type_id'] == '3') {
        this.menuList = [
          {
            icon: 'fas fa-clipboard',
            name: 'บันทึกค่ามิเตอร์ไฟฟ้า',
            path: '/electric-bill',
          },
          {
            icon: 'fas fa-file-medical-alt',
            name: 'ประวัติค่ามิเตอร์ไฟฟ้า',
            path: '/history-electric-bill',
          },
          // {
          //   icon: 'fas fa-quote-right',
          //   name: 'คำถามที่พบบ่อย',
          //   path: '/qa',
          // },
        ];
      }
    } else {
      // เมนู Student
      this.menuList = [
        {
          icon: 'fas fa-user-tag',
          name: 'ค่าใช้จ่ายส่วนตัว',
          path: '/student/dormitory',
        },
        {
          icon: 'fas fa-file-medical-alt',
          name: 'ค่าไฟฟ้าส่วนเกิน',
          path: '/student/electric',
        },
        {
          icon: 'fas fa-quote-right',
          name: 'คำถามที่พบบ่อย',
          path: '/student/qa',
        },
      ];
    }
  }

  public onLogout = () => {
    this.service
      .showConfirm('', 'ยืนยันการออกจากระบบ', 'warning')
      .then((value) => {
        if (value) {
          this.service.loading.show();
          this.service.localStorage.clear();
          window.location.replace(environment.ssoLogout);
        }
      });
  };
}
