import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';

const _window: any = window;

@Component({
  selector: 'app-electric',
  templateUrl: './electric.component.html',
  styleUrls: ['./electric.component.scss'],
})
export class ElectricComponent implements OnInit {
  public roomSearchData: Array<any> = [];
  public roomText: string = '';
  public receiptNumber: string = '';
  public listSelected: any = null;

  constructor(public service: AppService) {
    this.service.setHeaderPage('student-cost/electric', 'ค่าไฟประจำเดือน');
  }

  ngOnInit() {}

  public searchRoom = (roomNumber: string) => {
    this.roomSearchData = [];
    this.roomText = roomNumber;
    this.service
      .httpGet(
        `/admin/searchRoom/${roomNumber}?token=${
          this.service.getUserLogin()['token']
        }`
      )
      .then((value: any) => {
        console.log(value);
        if (value.success) {
          if (value.rowCount > 0) {
            this.roomSearchData = value.result;
            // console.log(this.roomSearchData);
          } else {
            this.roomSearchData = null;
          }
        }
      });
  };

  public getOldMonth = (month: string) => {
    return this.roomSearchData.filter((el) => {
      return el.month_read < month;
    }).length > 0
      ? this.roomSearchData.filter((el) => {
          return el.month_read < month;
        })[0]
      : null;
  };

  public payElectric = (data) => {
    console.log(data);
    this.service
      .showConfirm(
        `ยืนยันการชำระเงิน ห้อง${data.room_number}`,
        `จำนวนเงิน ${data.electric_cost_add} บาท`,
        'warning'
      )
      .then((val: boolean) => {
        if (val) {
          let thisTime = new Date().getTime().toString();
          let ramdomVal = Math.random().toString().split('.').pop();
          let form = {
            // receiptNumber: `${ramdomVal.substring(
            //   ramdomVal.length - 4,
            //   ramdomVal.length - 1
            // )}${thisTime.substring(thisTime.length - 8, thisTime.length - 1)}`,
            receiptNumber: this.receiptNumber,
            room_number: data.room_number,
            month_read: data.month_read,
          };

          this.service
            .httpPost(
              `/admin/setElectricBill?token=${
                this.service.getUserLogin()['token']
              }`,
              JSON.stringify(form)
            )
            .then((value: any) => {
              if (value.result) {
                this.searchRoom(this.roomText);
                this.service.showAlert('บันทึกสำเร็จ', ``, 'success');
                this.receiptNumber = '';
                this.listSelected = null;
                _window.$('#exampleModalReceiptNumber').modal('hide');
              }
            });
        }
      });
  };
}
