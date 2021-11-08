import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-notfound',
  templateUrl: './notfound.component.html',
  styleUrls: ['./notfound.component.scss'],
})
export class NotfoundComponent implements OnInit {
  constructor(public service: AppService) {
    this.service.getRouter((value: string) => {
      this.service.setHeaderPage(
        `${value.replace('/', '')}`,
        'ไม่พบเนื้อหาที่ต้องการ'
      );
    });
  }

  ngOnInit(): void {}
}
