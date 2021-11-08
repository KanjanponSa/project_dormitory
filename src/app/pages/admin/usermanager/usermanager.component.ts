import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-usermanager',
  templateUrl: './usermanager.component.html',
  styleUrls: ['./usermanager.component.scss'],
})
export class UsermanagerComponent implements OnInit {
  constructor(public service: AppService) {
    this.service.setHeaderPage('usermanager', 'จัดการบัญชีผู้ใช้');
  }

  ngOnInit(): void {}
}
