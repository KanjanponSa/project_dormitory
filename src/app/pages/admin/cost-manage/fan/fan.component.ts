import { Component, OnInit, Input } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-fan',
  templateUrl: './fan.component.html',
  styleUrls: ['./fan.component.scss'],
})
export class FanComponent implements OnInit {
  public formCostTerm1: FormGroup;
  public formCostTerm2: FormGroup;

  constructor(private formBuilder: FormBuilder, public service: AppService) {
    this.service.setHeaderPage(
      'cost-manage/fan',
      'จัดการรายการค่าใช้จ่าย (ห้องพัดลม)'
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
        console.log(val);
        if (val.rowCount > 0) {
          val.result
            .filter((e) => {
              return e.room_type == '1';
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
