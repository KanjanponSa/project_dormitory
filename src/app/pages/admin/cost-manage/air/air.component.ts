import { AppService } from './../../../../services/app.service';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-air',
  templateUrl: './air.component.html',
  styleUrls: ['./air.component.scss'],
})
export class AirComponent implements OnInit {
  public formCostTerm1: FormGroup;
  public formCostTerm2: FormGroup;

  constructor(private formBuilder: FormBuilder, public service: AppService) {
    this.service.setHeaderPage(
      'cost-manage/air',
      'จัดการรายการค่าใช้จ่าย (ห้องแอร์)'
    );
  }

  ngOnInit(): void {
    this.formCostTerm1 = this.formBuilder.group({
      dormitory: ['', Validators.required],
      electric_first: ['', Validators.required],
      electric_unit: ['', Validators.required],
      id: ['', Validators.required],
      insurance: ['', Validators.required],
      room_type: ['', Validators.required],
      term: ['', Validators.required],
      water_first: ['', Validators.required],
    });

    this.formCostTerm2 = this.formBuilder.group({
      dormitory: ['', Validators.required],
      electric_first: ['', Validators.required],
      electric_unit: ['', Validators.required],
      id: ['', Validators.required],
      insurance: ['', Validators.required],
      room_type: ['', Validators.required],
      term: ['', Validators.required],
      water_first: ['', Validators.required],
    });

    this.onLoadData();
  }

  private onLoadData = () => {
    this.service
      .httpGet(
        `admin/getCostValue?token=${this.service.getUserLogin()['token']}`
      )
      .then((val: any) => {
        if (val.rowCount > 0) {
          val.result
            .filter((e) => {
              return e.room_type == '2';
            })
            .forEach((element) => {
              if (element.term == '1')
                this.formCostTerm1.patchValue({ ...element });
              else if (element.term == '2')
                this.formCostTerm2.patchValue({ ...element });
            });
        }
      });
  };

  public onSubmitTerm1 = () => {
    this.service
      .showConfirm(`ยืนยันการบันทึก`, `ภาคเรียนที่ 1`, 'warning')
      .then((val) => {
        if (val) {
          this.service
            .httpPost(
              `admin/setCostValue?token=${
                this.service.getUserLogin()['token']
              }`,
              JSON.stringify(this.formCostTerm1.value)
            )
            .then((val) => {
              console.log(val);
            })
            .finally(() => {
              this.onLoadData();
            });
        }
      });
  };

  public onSubmitTerm2 = () => {
    this.service
      .showConfirm(`ยืนยันการบันทึก`, `ภาคเรียนที่ 2`, 'warning')
      .then((val) => {
        if (val) {
          this.service
            .httpPost(
              `admin/setCostValue?token=${
                this.service.getUserLogin()['token']
              }`,
              JSON.stringify(this.formCostTerm2.value)
            )
            .then((val) => {
              console.log(val);
            })
            .finally(() => {
              this.onLoadData();
            });
        }
      });
  };
}
