import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';

import pdfMake from 'src/app/services/pdfmake/pdfmake';
import pdfFonts from 'src/app/services/pdfmake/vfs_fonts';

pdfMake.fonts = {
  THSarabun: {
    normal: 'THSarabun.ttf',
    bold: 'THSarabun Bold.ttf',
    italics: 'THSarabun Italic.ttf',
    bolditalics: 'THSarabun Bold Italic.ttf',
  },
  Roboto: {
    normal: 'Roboto-Regular.ttf',
    bold: 'Roboto-Medium.ttf',
    italics: 'Roboto-Italic.ttf',
    bolditalics: 'Roboto-MediumItalic.ttf',
  },
};
pdfMake.vfs = pdfFonts.pdfMake ? pdfFonts.pdfMake.vfs : pdfMake.vfs;

const _window: any = window;

@Component({
  selector: 'app-electric-list',
  templateUrl: './electric-list.component.html',
  styleUrls: ['./electric-list.component.scss'],
})
export class ElectricListComponent implements OnInit {
  public roomSearchData: Array<any> = [];
  public listSelected: any = null;

  constructor(public service: AppService) {}

  ngOnInit(): void {
    this.searchRoom(
      `${this.service.getUserLogin()['room_number']}`.split('/')[0]
    );
  }

  public searchRoom = (roomNumber: string) => {
    this.roomSearchData = [];
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

  printPDF = (data) => {
    let newData = [];
    let newArr = [];
    newData.push(data);

    newArr.push([
      { text: `ห้องพัก`, bold: true },
      { text: `เดือน`, bold: true },
      { text: `เลขที่จดครั้งก่อน`, bold: true },
      { text: `เลขที่จดครั้งหลัง`, bold: true },
      { text: `จำนวนหน่วย`, bold: true },
      { text: `ค่าไฟคงเหลือที่ยกยอดมา`, bold: true },
      { text: `ค่าไฟฟ้าประจำเดือน`, bold: true },
      { text: `ค่าไฟคงเหลือ`, bold: true },
      { text: `ค่าไฟที่ต้องชำระเพิ่ม`, bold: true },
    ]);

    newData.forEach((element, index) => {
      newArr.push([
        { text: `${element.room_number}`, bold: false },
        { text: `${element.month_read}`, bold: false },
        {
          text: this.getOldMonth(element.month_read)
            ? this.getOldMonth(element.month_read)['value_meter']
            : 0,
          bold: false,
        },
        {
          text: `${element.value_meter}`,
          bold: false,
        },
        { text: `${element.electric_cost_unit}`, bold: false },
        { text: `${element.electric_cost_old}`, bold: false },
        { text: `${element.electric_cost_month}`, bold: false },
        { text: `${element.electric_cost_left}`, bold: false },
        { text: `${element.electric_cost_add}`, bold: true },
      ]);
    });

    this.service
      .httpPost(`user/setElectricBillSeen`, JSON.stringify(data))
      .then((val: any) => {
        console.log(val);
        if (val.result) {
          this.exportAsPdfFile(newArr);
        }
      });
  };

  private exportAsPdfFile = (arr: Array<any>) => {
    const documentDefinition = this.getDocumentDefinition(arr);
    pdfMake.createPdf(documentDefinition).download('ใบแจ้งชำระค่าไฟส่วนเกิน');
  };

  private getDocumentDefinition(arr: Array<any>) {
    let widths = [];

    arr[0].forEach((e) => {
      widths.push('auto');
    });

    return {
      pageSize: 'A4',
      pageOrientation: 'landscape',
      content: [
        {
          table: {
            headerRows: 1,
            widths: [...widths],
            body: [...arr],
          },
        },
        {
          margin: [0, 50, 0, 0],
          ul: [
            'อัตราค่าไฟฟ้าหน่วยละ 8 บาท',
            'กรุณาชำระเงินภายในวันที่ 20 ของเดือนที่ได้รับใบแจ้งชำระ\nสามารถติดต่อชำระค่าไฟส่วนเกินได้ที่เจ้าหน้าที่การเงิน\nสำนักงานหอพักนักศึกษา มทร.อีสาน ( จ-ศ 08:30 - 15:30 )',
            'กรุณานำใบแจ้งชำระมาด้วย',
          ],
        },
      ],
      defaultStyle: {
        font: 'THSarabun',
        fontSize: 16,
      },
    };
  }
}
