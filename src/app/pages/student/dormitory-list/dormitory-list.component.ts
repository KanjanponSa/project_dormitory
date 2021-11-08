import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-dormitory-list',
  templateUrl: './dormitory-list.component.html',
  styleUrls: ['./dormitory-list.component.scss'],
})
export class DormitoryListComponent implements OnInit {
  public studentSearchData: any = null;
  public studentCost: Array<any> = [];
  public costValue: Array<any> = [];
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

  constructor(public service: AppService) {}

  ngOnInit(): void {
    this.getCostValue();
  }

  private getStudentCost = () => {
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
        `/admin/getStudentCost/${
          this.service.getUserLogin()['std_code']
        }?token=${this.service.getUserLogin()['token']}`
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

  private searchStudent = () => {
    this.studentSearchData = null;
    this.studentCost = [];

    this.service
      .httpGet(
        `/admin/searchStudent/${
          this.service.getUserLogin()['std_code']
        }?token=${this.service.getUserLogin()['token']}`
      )
      .then((value: any) => {
        console.log(value);
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

    this.searchStudent();
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
