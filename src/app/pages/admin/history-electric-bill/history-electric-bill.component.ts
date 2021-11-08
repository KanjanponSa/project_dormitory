import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-history-electric-bill',
  templateUrl: './history-electric-bill.component.html',
  styleUrls: ['./history-electric-bill.component.scss'],
})
export class HistoryElectricBillComponent implements OnInit {
  public allRoom: Array<any> = [];
  public allMeter: Array<any> = [];
  public buildSelect: string = '1';
  public floorSelect: string = '2';
  public monthSelect: string = '';
  public roomSelected: Array<any> = [];
  public allMonth: Array<any> = [];

  constructor(public service: AppService) {
    this.service.setHeaderPage(
      'history-electric-bill',
      'ประวัติค่ามิเตอร์ไฟฟ้า'
    );
  }

  async ngOnInit() {
    this.allRoom = await this.getRoom();
    this.allMeter = await this.getAllMeter();
    this.selectRoom();
  }

  private getRoom = (): any => {
    return new Promise((resolve) => {
      this.service
        .httpGet(
          `/support/getRoom?token=${this.service.getUserLogin()['token']}`
        )
        .then((value: any) => {
          if (value.result.result.length > 0) {
            resolve(value.result.result); // room_number
          } else {
            resolve([]);
          }
        });
    });
  };

  private getAllMeter = (): any => {
    return new Promise((resolve) => {
      this.service
        .httpGet(
          `/admin/getAllMeter?token=${this.service.getUserLogin()['token']}`
        )
        .then((value: any) => {
          resolve(value.result);
          if (value.result.length > 0) {
            let month = [];
            value.result.forEach((element) => {
              month.push(element['month_read']);
            });
            this.allMonth = Array.from(new Set(month));
            this.monthSelect = this.allMonth[this.allMonth.length - 1];
          }
        });
    });
  };

  public selectRoom = () => {
    let build: Array<any> = this.allRoom.filter((el) => {
      return el.room_number.charAt(0) == this.buildSelect;
    });

    let floor: Array<any> = build.filter((el) => {
      return el.room_number.charAt(1) == this.floorSelect;
    });

    this.roomSelected = floor;
  };

  public getMeterInRoom = (room_number: string) => {
    return this.allMeter.filter((el) => {
      return el.room_number == room_number && el.month_read == this.monthSelect;
    });
  };
}
