import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-dormitory',
  templateUrl: './dormitory.component.html',
  styleUrls: ['./dormitory.component.scss'],
})
export class DormitoryComponent implements OnInit {
  public date = new FormControl(new Date());
  public listStudentCost: Array<any> = [];
  public listStudentCostOnDate: Array<any> = [];

  constructor(public service: AppService) {}

  ngOnInit(): void {
    this.getAllStudentCost();
    console.log(this.service.ArabicNumberToText('12345'));
  }

  public getAllStudentCost = () => {
    this.service
      .httpGet(
        `/admin/getAllStudentCost?token=${this.service.getUserLogin()['token']}`
      )
      .then((val: any) => {
        console.log(val);
        if (val.rowCount > 0) {
          this.listStudentCost = val.result;
          this.dateChange(this.date.value);
        } else {
          this.listStudentCost = [];
        }
      });
  };

  public exportFile = (
    arr: Array<any>,
    fileName: string,
    type: 'xlsx' | 'xls' | 'pdf'
  ) => {
    let newArr = [];

    if (type == 'pdf') {
      newArr.push([
        { text: `ลำดับที่`, bold: true },
        { text: `วันที่ใบเสร็จ`, bold: true },
        { text: `เลขที่ใบเสร็จ`, bold: true },
        { text: `ห้องที่`, bold: true },
        { text: `รหัสนักศึกษา`, bold: true },
        { text: `ชื่อ-นามสกุล`, bold: true },
        { text: `ภาคการศึกษา`, bold: true },
        { text: `ค่าห้องพัก`, bold: true },
        { text: `ค่าไฟล่วงหน้า`, bold: true },
        { text: `ค่าน้ำประปาเหมาจ่าย`, bold: true },
        { text: `ค่าประกัน`, bold: true },
        { text: `รวม`, bold: true },
      ]);

      arr.forEach((element, index) => {
        newArr.push([
          { text: `${index + 1}`, bold: false },
          { text: `${this.subDate(element.update_time)}`, bold: false },
          { text: `${element.receiptNumber}`, bold: false },
          { text: `${element.room_number}`, bold: false },
          { text: `${element.std_code}`, bold: false },
          {
            text: `${element.nameTitle}${element.fname} ${element.lname}`,
            bold: false,
          },
          { text: `${element.term}`, bold: false },
          { text: `${element.dorimitory}`, bold: false },
          { text: `${element.electric_first}`, bold: false },
          { text: `${element.water_first}`, bold: false },
          { text: `${element.insurance}`, bold: false },
          { text: `${this.sumCost(element)}`, bold: false },
        ]);

        // newArr.push([{
        //   [`ลำดับที่`]: `${index + 1}`,
        //   [`วันที่ใบเสร็จ`]: `${this.subDate(element.update_time)}`,
        //   [`เลขที่ใบเสร็จ`]: `${element.receiptNumber}`,
        //   [`ห้องที่`]: `${element.room_number}`,
        //   [`รหัสนักศึกษา`]: `${element.std_code}`,
        //   [`ชื่อ-นามสกุล`]: `${element.nameTitle}${element.fname} ${element.lname}`,
        //   [`ภาคการศึกษา`]: `${element.term}`,
        //   [`ค่าห้องพัก`]: `${element.dorimitory}`,
        //   [`ค่าไฟล่วงหน้า`]: `${element.electric_first}`,
        //   [`ค่าน้ำประปาเหมาจ่าย`]: `${element.water_first}`,
        //   [`ค่าประกัน`]: `${element.insurance}`,
        //   [`รวม`]: `${this.sumCost(element)}`,
        // }]);
      });

      this.service.exportAsPdfFile(newArr);
    } else {
      arr.forEach((element, index) => {
        newArr.push({
          [`ลำดับที่`]: `${index + 1}`,
          [`วันที่ใบเสร็จ`]: `${this.subDate(element.update_time)}`,
          [`เลขที่ใบเสร็จ`]: `${element.receiptNumber}`,
          [`ห้องที่`]: `${element.room_number}`,
          [`รหัสนักศึกษา`]: `${element.std_code}`,
          [`ชื่อ-นามสกุล`]: `${element.nameTitle}${element.fname} ${element.lname}`,
          [`ภาคการศึกษา`]: `${element.term}`,
          [`ค่าห้องพัก`]: `${element.dorimitory}`,
          [`ค่าไฟล่วงหน้า`]: `${element.electric_first}`,
          [`ค่าน้ำประปาเหมาจ่าย`]: `${element.water_first}`,
          [`ค่าประกัน`]: `${element.insurance}`,
          [`รวม`]: `${this.sumCost(element)}`,
        });
      });

      this.service.exportAsExcelFile(newArr, fileName, type);
    }
  };

  public sumCol = (data, key) => {
    let sum = 0;
    data.forEach((e, i) => {
      sum += parseInt(e[key]);
    });
    return sum;
  };

  public dateChange = (data) => {
    let timeSelect = new Date(data).toLocaleDateString();
    let result = this.listStudentCost.filter((e) => {
      return new Date(e.update_time).toLocaleDateString() == timeSelect;
    });
    this.listStudentCostOnDate = result;
  };

  public sumCost = (data) => {
    let sum =
      parseInt(data.electric_first) +
      parseInt(data.dorimitory) +
      parseInt(data.water_first) +
      parseInt(data.insurance);
    return sum;
  };

  public subDate = (date) => {
    let nD = new Date(date);
    return `${this.service.zeroPad(nD.getDate(), 10)}/${this.service.zeroPad(
      nD.getMonth() + 1,
      10
    )}/${this.service.zeroPad(nD.getFullYear() + 543, 1000)}`;
  };
}
