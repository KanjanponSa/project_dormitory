import { AppService } from './../../../services/app.service';
import { Component, OnInit } from '@angular/core';
import { Form, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-electric-bill',
  templateUrl: './electric-bill.component.html',
  styleUrls: ['./electric-bill.component.scss'],
})
export class ElectricBillComponent implements OnInit {
  public serverTime: Date = new Date();
  public allRoom: Array<any> = [];
  public currentBill: Array<any> = [];
  public buildSelect: string = '1';
  public floorSelect: string = '2';
  public roomSelected: Array<any> = [];
  public rateRoom: Array<any> = [];

  public monthSelect: number = 0;
  public yearSelect: number = 0;

  constructor(public service: AppService) {
    this.service.setHeaderPage('electric-bill', 'บันทึกค่ามิเตอร์ไฟฟ้า');
  }

  async ngOnInit() {
    this.serverTime = await this.getServerTime();
    this.allRoom = await this.getRoom();
    await this.initialData();
    this.selectRoom();
    this.onLoadData();
  }

  public initialData = async () => {
    this.currentBill = await this.getCurrentMeter();
  };

  private onLoadData = () => {
    this.service
      .httpGet(
        `admin/getCostValue?token=${this.service.getUserLogin()['token']}`
      )
      .then((val: any) => {
        if (val.rowCount > 0) {
          this.rateRoom = val.result.filter(
            (e, i) => e.term == `${this.service.getTerm()}`
          );
          console.log(this.rateRoom);
        }
      });
  };

  private getCurrentMeter = (): Promise<any> => {
    return new Promise((resolve) => {
      this.service
        .httpGet(
          `/admin/getCurrentMeter/${this.service.zeroPad(
            this.monthSelect + 1,
            10
          )}/${this.serverTime.getFullYear()}?token=${
            this.service.getUserLogin()['token']
          }`
        )
        .then((value: any) => {
          // console.log(value);
          resolve(value.result);
        });
    });
  };

  private getServerTime = (): any => {
    return new Promise((resolve) => {
      this.service
        .httpGet(
          `/support/getServerTime?token=${this.service.getUserLogin()['token']}`
        )
        .then((value: any) => {
          let tmp = new Date(value.result);
          this.monthSelect = this.serverTime.getMonth();
          this.yearSelect = this.serverTime.getFullYear();
          resolve(tmp);
        });
    });
  };

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

  public selectRoom = () => {
    let build: Array<any> = this.allRoom.filter((el) => {
      return el.room_number.charAt(0) == this.buildSelect;
    });

    let floor: Array<any> = build.filter((el) => {
      return el.room_number.charAt(1) == this.floorSelect;
    });

    this.roomSelected = floor;
  };

  public updateBill = (data: any) => {
    console.log(data);
    this.service
      .showConfirm(
        `ห้อง ${data.room_number}`,
        'ยืนยันการบันทึกข้อมูล',
        'warning'
      )
      .then(async (value: boolean) => {
        if (value) {
          const checkDel = () => {
            return new Promise((res) => {
              this.service
                .httpPost(
                  `/admin/deleteCurrentMeter?token=${
                    this.service.getUserLogin()['token']
                  }`,
                  JSON.stringify({
                    room_number: data.room_number,
                    month_read: `${this.service.zeroPad(
                      this.monthSelect + 1,
                      10
                    )}/${this.serverTime.getFullYear()}`,
                  })
                )
                .then(async (value: any) => {
                  console.log(value);
                  this.currentBill = await this.getCurrentMeter();
                  res(value);
                });
            });
          };

          await checkDel();
          const room_data: any = await this.service.httpGet(
            `/support/getStudentInRoom/${data.room_number}`
          );
          const result = room_data?.result[0];
          const totalStudent: number = result?.total
            ? parseInt(result?.total)
            : 4;

          let rawData = {
            room_number: data.room_number,
            value_meter: data.meter,
            month_read: `${this.service.zeroPad(
              this.monthSelect + 1,
              10
            )}/${this.serverTime.getFullYear()}`,
            user_edit: this.service.getUserLogin()['username'],
            ...this.sumFirstCost(
              data.room_number,
              data.meter,
              totalStudent,
              data.old_meter
            ),
          };

          data.old = this.getMeterBill(
            data.room_number,
            this.service.zeroPad(this.monthSelect, 10) +
              '/' +
              this.serverTime.getFullYear()
          );

          if (data.old) {
            if (data.meter >= 0) {
              this.service
                .httpPost(
                  `/admin/setCurrentMeter?token=${
                    this.service.getUserLogin()['token']
                  }`,
                  JSON.stringify(rawData)
                )
                .then(async (value: any) => {
                  if (value) {
                    this.currentBill = await this.getCurrentMeter();
                  }
                });
            } else {
              this.service.showAlert(
                data.room_number,
                'โปรดกรอกข้อมูลให้ถูกต้อง',
                'warning'
              );
            }
          } else {
            this.service
              .httpPost(
                `/admin/setCurrentMeter?token=${
                  this.service.getUserLogin()['token']
                }`,
                JSON.stringify(rawData)
              )
              .then(async (value: any) => {
                if (value) {
                  this.currentBill = await this.getCurrentMeter();
                }
              });
          }
        }
      });
  };

  public getMeterBill = (room_number: string, month_read: string) => {
    let bill = this.currentBill.filter((el) => {
      return el.room_number == room_number && el.month_read == month_read;
    });
    return bill.length > 0 ? bill[0] : null;
  };

  private sumFirstCost = (
    room_number,
    current_meter,
    totalStudent,
    old_meter
  ) => {
    let electric_cost_unit: number; // หน่วยไฟฟ้าเดือนนี้
    let electric_cost_old: number; // ค่าไฟคงเหลือยกยอดมา
    let electric_cost_month: number; // ค่าไฟเดือนนี้
    let electric_cost_left: number; // ค่าไฟคงเหลือยกยอดไป
    let electric_cost_add: number; // ค่าไฟที่ต้องจ่ายเพิ่ม
    let isPay: number; // สถานะการหักเงินสำเร็จ ( 0 = ไม่สำเร็จ, 1 = สำเร็จ )

    const isRoomFan: boolean = parseInt(`${room_number}`.charAt(1)) < 8;
    const filterRate = this.rateRoom.filter((e, i) =>
      e.room_type == isRoomFan ? '1' : '2'
    );

    const meterRate =
      filterRate.length > 0 ? parseInt(filterRate[0]['electric_unit']) : 8;
    const isRate: number =
      totalStudent * parseInt(filterRate[0]['electric_first']);

    let firstCost = this.currentBill
      .filter((el) => {
        return el.room_number == room_number;
      })
      .sort((a, b) => {
        return b['value_meter'] - a['value_meter'];
      });

    electric_cost_unit =
      firstCost.length > 0
        ? parseInt(current_meter) - parseInt(old_meter)
        : parseInt(old_meter) > 0
        ? parseInt(current_meter) - parseInt(old_meter)
        : parseInt(current_meter); // หน่วยไฟฟ้าเดือนนี้

    electric_cost_old =
      firstCost.length > 0
        ? parseInt(firstCost[0]['electric_cost_left'])
        : room_number == '1201'
        ? totalStudent * 1000
        : isRate -
            firstCost.reduce(
              (a, b) => parseInt(a) + parseInt(b['electric_cost_old'] || 0),
              0
            ) >
          0
        ? room_number == '1201'
          ? totalStudent * 1000
          : isRate -
            firstCost.reduce(
              (a, b) => parseInt(a) + parseInt(b['electric_cost_old'] || 0),
              0
            )
        : 0; // ค่าไฟคงเหลือยกยอดมา

    electric_cost_month = electric_cost_unit * meterRate; // ค่าไฟเดือนนี้

    electric_cost_left =
      electric_cost_old > 0
        ? electric_cost_old - electric_cost_month > 0
          ? electric_cost_old - electric_cost_month
          : 0
        : 0; // ค่าไฟคงเหลือยกยอดไป

    electric_cost_add =
      electric_cost_old - electric_cost_month >= 0
        ? 0
        : Math.abs(electric_cost_old - electric_cost_month); // ค่าไฟที่ต้องจ่ายเพิ่ม

    isPay = electric_cost_add <= 0 ? 1 : 0; // สถานะการหักเงินสำเร็จ

    return {
      electric_cost_unit_old: old_meter,
      electric_cost_unit: electric_cost_unit,
      electric_cost_old: electric_cost_old,
      electric_cost_month: electric_cost_month,
      electric_cost_left: electric_cost_left,
      electric_cost_add: electric_cost_add,
      isPay: isPay,
    };
  };
}
