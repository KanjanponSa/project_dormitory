import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-dormitory',
  templateUrl: './dormitory.component.html',
  styleUrls: ['./dormitory.component.scss'],
})
export class DormitoryComponent implements OnInit {
  public studentSearchData: any = null;
  public studentId: string = '';
  public costValue: Array<any> = [];
  public formTerm1: FormGroup;
  public formTerm2: FormGroup;
  public studentCost: Array<any> = [];
  public studentCostTerm1: {
    dorimitory: number;
    electric_first: number;
    water_first: number;
    insurance: number;
  } = {
    dorimitory: 0,
    electric_first: 0,
    water_first: 0,
    insurance: 0,
  };
  public studentCostTerm2: {
    dorimitory: number;
    electric_first: number;
    water_first: number;
    insurance: number;
  } = {
    dorimitory: 0,
    electric_first: 0,
    water_first: 0,
    insurance: 0,
  };

  constructor(public service: AppService, private formBuilder: FormBuilder) {
    this.service.setHeaderPage('student-cost/dormitory', 'ค่าใช้จ่ายหอพัก');
  }

  ngOnInit() {
    this.getCostValue();
    this.formTerm1 = this.formBuilder.group({
      receiptNumber: ['', Validators.required],
      term: ['1'],
      studentId: ['', Validators.required],
      dorimitory: [0, Validators.required],
      electric_first: [0, Validators.required],
      water_first: [0, Validators.required],
      insurance: [0, Validators.required],
      cashier: [this.service.getUserLogin()['username'], Validators.required],
    });

    this.formTerm2 = this.formBuilder.group({
      receiptNumber: ['', Validators.required],
      term: ['2'],
      studentId: ['', Validators.required],
      dorimitory: [0, Validators.required],
      electric_first: [0, Validators.required],
      water_first: [0, Validators.required],
      insurance: [0, Validators.required],
      cashier: [this.service.getUserLogin()['username'], Validators.required],
    });
  }

  public onSubmitTerm1 = (dorLim, elecLim, waLim, insuLim) => {
    // let thisTime = new Date().getTime().toString();
    // let ramdomVal = Math.random().toString().split('.').pop();
    // this.formTerm1.patchValue({
    //   receiptNumber: `${ramdomVal.substring(
    //     ramdomVal.length - 4,
    //     ramdomVal.length - 1
    //   )}${thisTime.substring(thisTime.length - 8, thisTime.length - 1)}`,
    // });

    if (this.formTerm1.valid) {
      if (
        this.formTerm1.value.dorimitory <= 0 &&
        this.formTerm1.value.electric_first <= 0 &&
        this.formTerm1.value.water_first <= 0 &&
        this.formTerm1.value.insurance <= 0
      ) {
        this.service.showAlert(
          'โปรดกรอกข้อมูลให้ครบถ้วน',
          'ภาคเรียนที่ 1',
          'warning'
        );
      } else {
        if (
          this.formTerm1.value.dorimitory <= parseInt(dorLim) &&
          this.formTerm1.value.electric_first <= parseInt(elecLim) &&
          this.formTerm1.value.water_first <= parseInt(waLim) &&
          this.formTerm1.value.insurance <= parseInt(insuLim)
        ) {
          this.service
            .showConfirm(
              'ยืนยันการชำระเงิน (ภาคเรียนที่ 1)',
              'ระบบจะทำการสร้างเลขที่ใบเสร็จโดยอัตโนมัติ',
              'warning'
            )
            .then((val: boolean) => {
              if (val) {
                this.service
                  .httpPost(
                    `/admin/setStudentCost?token=${
                      this.service.getUserLogin()['token']
                    }`,
                    JSON.stringify(this.formTerm1.value)
                  )
                  .then((val: any) => {
                    this.getStudentCost();
                    if (val?.success ?? false) {
                      this.service.showAlert('บันทึกสำเร็จ', '', 'success');
                      this.formTerm1.patchValue({
                        receiptNumber: '',
                        dorimitory: 0,
                        electric_first: 0,
                        water_first: 0,
                        insurance: 0,
                      });
                    } else {
                      this.service.showAlert(
                        'บันทึกไม่สำเร็จ',
                        'ไม่สามารถใช้เลขที่ใบเสร็จซ้ำได้',
                        'error'
                      );
                    }
                  });
              }
            });
        } else {
          this.service.showAlert(
            'โปรดระบบุจำนวนเงินให้ถูกต้อง',
            'ภาคเรียนที่ 1',
            'warning'
          );
        }
      }
    } else {
      this.service.showAlert(
        'โปรดกรอกข้อมูลให้ครบถ้วน',
        'ภาคเรียนที่ 1',
        'warning'
      );
    }
  };

  public onSubmitTerm2 = (dorLim, elecLim, waLim, insuLim) => {
    // let thisTime = new Date().getTime().toString();
    // let ramdomVal = Math.random().toString().split('.').pop();
    // this.formTerm2.patchValue({
    //   receiptNumber: `${ramdomVal.substring(
    //     ramdomVal.length - 4,
    //     ramdomVal.length - 1
    //   )}${thisTime.substring(thisTime.length - 8, thisTime.length - 1)}`,
    // });

    if (this.formTerm2.valid) {
      if (
        this.formTerm2.value.dorimitory <= 0 &&
        this.formTerm2.value.electric_first <= 0 &&
        this.formTerm2.value.water_first <= 0 &&
        this.formTerm2.value.insurance <= 0
      ) {
        this.service.showAlert(
          'โปรดกรอกข้อมูลให้ครบถ้วน',
          'ภาคเรียนที่ 2',
          'warning'
        );
      } else {
        if (
          this.formTerm2.value.dorimitory <= parseInt(dorLim) &&
          this.formTerm2.value.electric_first <= parseInt(elecLim) &&
          this.formTerm2.value.water_first <= parseInt(waLim) &&
          this.formTerm2.value.insurance <= parseInt(insuLim)
        ) {
          this.service
            .showConfirm(
              'ยืนยันการชำระเงิน (ภาคเรียนที่ 2)',
              'ระบบจะทำการสร้างเลขที่ใบเสร็จโดยอัตโนมัติ',
              'warning'
            )
            .then((val: boolean) => {
              if (val) {
                this.service
                  .httpPost(
                    `/admin/setStudentCost?token=${
                      this.service.getUserLogin()['token']
                    }`,
                    JSON.stringify(this.formTerm2.value)
                  )
                  .then((val: any) => {
                    this.getStudentCost();
                    this.service.showAlert('บันทึกสำเร็จ', '', 'success');
                    this.formTerm2.patchValue({
                      receiptNumber: '',
                      dorimitory: 0,
                      electric_first: 0,
                      water_first: 0,
                      insurance: 0,
                    });
                  });
              }
            });
        } else {
          this.service.showAlert(
            'โปรดระบบุจำนวนเงินให้ถูกต้อง',
            'ภาคเรียนที่ 2',
            'warning'
          );
        }
      }
    } else {
      this.service.showAlert(
        'โปรดกรอกข้อมูลให้ครบถ้วน',
        'ภาคเรียนที่ 2',
        'warning'
      );
    }
  };

  public getStudentCost = () => {
    this.studentCost = [];
    this.studentCostTerm1 = {
      dorimitory: 0,
      electric_first: 0,
      water_first: 0,
      insurance: 0,
    };
    this.studentCostTerm2 = {
      dorimitory: 0,
      electric_first: 0,
      water_first: 0,
      insurance: 0,
    };
    this.service
      .httpGet(
        `/admin/getStudentCost/${this.studentId}?token=${
          this.service.getUserLogin()['token']
        }`
      )
      .then((value: any) => {
        console.log(value);
        if (value.success) {
          if (value.rowCount > 0) {
            this.studentCost = value.result;
            let tmpVal1 = {
              dorimitory: 0,
              electric_first: 0,
              water_first: 0,
              insurance: 0,
            };
            let tmpVal2 = {
              dorimitory: 0,
              electric_first: 0,
              water_first: 0,
              insurance: 0,
            };
            this.studentCost
              .filter((e) => {
                return e.term == '1';
              })
              .forEach((el, i) => {
                tmpVal1.dorimitory += parseInt(el['dorimitory']);
                tmpVal1.electric_first += parseInt(el['electric_first']);
                tmpVal1.water_first += parseInt(el['water_first']);
                tmpVal1.insurance += parseInt(el['insurance']);
              });

            this.studentCost
              .filter((e) => {
                return e.term == '2';
              })
              .forEach((el, i) => {
                tmpVal2.dorimitory += parseInt(el['dorimitory']);
                tmpVal2.electric_first += parseInt(el['electric_first']);
                tmpVal2.water_first += parseInt(el['water_first']);
                tmpVal2.insurance += parseInt(el['insurance']);
              });

            this.studentCostTerm1 = { ...tmpVal1 };
            this.studentCostTerm2 = { ...tmpVal2 };
          }
        }
      });
  };

  public searchStudent = (studentId: string) => {
    this.studentSearchData = null;
    this.studentId = studentId;
    this.studentCost = [];

    this.formTerm1.patchValue({
      studentId: studentId,
      dorimitory: 0,
      electric_first: 0,
      water_first: 0,
      insurance: 0,
    });
    this.formTerm2.patchValue({
      studentId: studentId,
      dorimitory: 0,
      electric_first: 0,
      water_first: 0,
      insurance: 0,
    });

    this.service
      .httpGet(
        `/admin/searchStudent/${studentId}?token=${
          this.service.getUserLogin()['token']
        }`
      )
      .then((value: any) => {
        if (value.success) {
          if (value.rowCount > 0) {
            this.studentSearchData = value.result[0];
          } else {
            this.service.showAlert('ไม่พบข้อมูลนักศึกษา', '', 'warning');
            this.studentSearchData = null;
          }
        }
      });

    this.getStudentCost();
  };

  private getCostValue = () => {
    this.costValue = [];
    this.service
      .httpGet(
        `/admin/getCostValue?token=${this.service.getUserLogin()['token']}`
      )
      .then((value: any) => {
        if (value) {
          if (value.rowCount > 0) {
            this.costValue = value.result;
          }
        }
        console.log(this.costValue);
      });
  };

  public searchCost = (term: string, room_type: string) => {
    return this.costValue.filter((el) => {
      return el.term == term && el.room_type == room_type;
    });
  };

  public studentCostTerm = (term: string) => {
    return this.studentCost.filter((e) => {
      return e.term == term;
    });
  };
}
