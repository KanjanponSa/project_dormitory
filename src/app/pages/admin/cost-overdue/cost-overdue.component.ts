import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';
import pdfMake from './../../../services/pdfmake/pdfmake';
import pdfFonts from './../../../services/pdfmake/vfs_fonts';

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

@Component({
  selector: 'app-cost-overdue',
  templateUrl: './cost-overdue.component.html',
  styleUrls: ['./cost-overdue.component.scss'],
})
export class CostOverdueComponent implements OnInit {
  public termSelect: string = '';
  public listOverdue: Array<any> = [];
  public listOverdueFilter: Array<any> = [];
  public listOfFaculty: Array<{
    key: string;
    name: string;
  }> = [];
  private listOfBranch: Array<{
    codeOfFaculty: string;
    key: string;
    name: string;
  }> = [];

  public facultySelect: string = '';
  public branchSelect: string = '';

  public p: number = 1;

  constructor(public service: AppService) {}

  ngOnInit(): void {}

  public exportPDF = () => {
    // console.log(this.listOverdueFilter);
    let newArr = [];

    newArr.push([
      { text: ``, bold: true },
      { text: `รหัสนักศึกษา`, bold: true },
      { text: `ชื่อ - สกุล`, bold: true },
      { text: `ห้องพัก`, bold: true },
      { text: `ค่าหอ`, bold: true },
      { text: `ค่าประกัน`, bold: true },
      { text: `ค่าไฟฟ้าล่วงหน้า`, bold: true },
      { text: `ค่าน้ำ`, bold: true },
    ]);

    this.listOverdueFilter.forEach((e, i) => {
      newArr.push([
        { text: `${i + 1}`, bold: false },
        { text: `${e.std_code}`, bold: false },
        { text: `${e.nameTitle}${e.fname} ${e.lname}`, bold: false },
        { text: `${e.room_number}`, bold: false },
        { text: `${e.dormitory_overdue}`, bold: false },
        { text: `${e.insurance_overdue}`, bold: false },
        { text: `${e.electric_first_overdue}`, bold: false },
        { text: `${e.water_first_overdue}`, bold: false },
      ]);
    });

    const documentDefinition = this.getDocumentDefinition(newArr);
    pdfMake.createPdf(documentDefinition).download('รายงานนักศึกษาที่ค้างชำระ');
  };

  public exportXLS = (type: 'xls' | 'xlsx') => {
    let newArr = [];

    this.listOverdueFilter.forEach((e, index) => {
      newArr.push({
        [`ลำดับที่`]: `${index + 1}`,
        [`รหัสนักศึกษา`]: `${e.std_code}`,
        [`ชื่อ - สกุล`]: `${e.nameTitle}${e.fname} ${e.lname}`,
        [`ห้องพัก`]: `${e.room_number}`,
        [`ค่าหอ`]: `${e.dormitory_overdue}`,
        [`ค่าประกัน`]: `${e.insurance_overdue}`,
        [`ค่าไฟฟ้าล่วงหน้า`]: `${e.electric_first_overdue}`,
        [`ค่าน้ำ`]: `${e.water_first_overdue}`,
      });
    });

    this.service.exportAsExcelFile(newArr, 'รายงานนักศึกษาที่ค้างชำระ', type);
  };

  private getDocumentDefinition(arr: Array<any>) {
    let widths = [];
    let facultySelect = this.listOfFaculty.filter(
      (e) => e.key === this.facultySelect
    )[0];
    let getBranch = this.getBranch().filter(
      (e) => e.key === this.branchSelect
    )[0];

    arr[0].forEach((e) => {
      widths.push('auto');
    });

    return {
      pageSize: 'A4',
      pageOrientation: 'portrait',
      content: [
        {
          text: 'เรื่อง แจ้งรายชื่อนักศึกษาที่ยังไม่ชำระค่าใช้จ่าย',
          style: 'header',
          alignment: 'center',
          bold: true,
          fontSize: 16,
        },
        {
          text: `${facultySelect.name} ${getBranch.name} ภาคเรียนที่ ${this.termSelect}`,
          style: 'header',
          alignment: 'center',
          bold: true,
          fontSize: 16,
          margin: [0, 0, 0, 14],
        },
        {
          table: {
            headerRows: 1,
            widths: [...widths],
            body: [...arr],
          },
        },
      ],
      defaultStyle: {
        font: 'THSarabun',
        fontSize: 14,
      },
    };
  }

  private resetVariable = (): void => {
    this.listOverdue = [];
    this.listOfFaculty = [];
    this.listOfBranch = [];
    this.facultySelect = '';
    this.branchSelect = '';
  };

  public onSelectTerm = (): void => {
    this.resetVariable();

    if (this.termSelect === '1') {
      this.service
        .httpGet(
          `/support/getOverdueTerm1?token=${
            this.service.getUserLogin()['token']
          }`
        )
        .then((value: any) => {
          if (value.result.rowCount > 0) {
            this.listOverdue = [...value.result.result];
          } else {
            this.service.showAlert('ไม่พบข้อมูล', '', 'warning');
            this.listOverdue = [];
          }
        })
        .finally(() => {
          if (this.listOverdue.length > 0) {
            let tmpFaculty = [];
            let tmpBranch = [];

            this.listOverdue.forEach((e, i) => {
              tmpFaculty = this.listOfFaculty.filter(
                (ee) =>
                  JSON.stringify(ee) ===
                  JSON.stringify({
                    key: e.faculty_code,
                    name: e.faculty_name,
                  })
              );

              tmpBranch = this.listOfBranch.filter(
                (ee) =>
                  JSON.stringify(ee) ===
                  JSON.stringify({
                    codeOfFaculty: e.faculty_code,
                    key: e.branch_code,
                    name: e.branch_name,
                  })
              );

              if (tmpFaculty.length === 0)
                this.listOfFaculty.push({
                  key: e.faculty_code,
                  name: e.faculty_name,
                });

              if (tmpBranch.length === 0)
                this.listOfBranch.push({
                  codeOfFaculty: e.faculty_code,
                  key: e.branch_code,
                  name: e.branch_name,
                });
            });
          }
        });
    } else if (this.termSelect === '2') {
      this.service
        .httpGet(
          `/support/getOverdueTerm2?token=${
            this.service.getUserLogin()['token']
          }`
        )
        .then((value: any) => {
          if (value.result.rowCount > 0) {
            this.listOverdue = [...value.result.result];
          } else {
            this.service.showAlert('ไม่พบข้อมูล', '', 'warning');
            this.listOverdue = [];
          }
        })
        .finally(() => {
          if (this.listOverdue.length > 0) {
            let tmpFaculty = [];
            let tmpBranch = [];

            this.listOverdue.forEach((e, i) => {
              tmpFaculty = this.listOfFaculty.filter(
                (ee) =>
                  JSON.stringify(ee) ===
                  JSON.stringify({
                    key: e.faculty_code,
                    name: e.faculty_name,
                  })
              );

              tmpBranch = this.listOfBranch.filter(
                (ee) =>
                  JSON.stringify(ee) ===
                  JSON.stringify({
                    codeOfFaculty: e.faculty_code,
                    key: e.branch_code,
                    name: e.branch_name,
                  })
              );

              if (tmpFaculty.length === 0)
                this.listOfFaculty.push({
                  key: e.faculty_code,
                  name: e.faculty_name,
                });

              if (tmpBranch.length === 0)
                this.listOfBranch.push({
                  codeOfFaculty: e.faculty_code,
                  key: e.branch_code,
                  name: e.branch_name,
                });
            });
          }
        });
    }
  };

  public getBranch = () => {
    return this.listOfBranch.filter(
      (e) => e.codeOfFaculty === this.facultySelect
    );
  };

  public onSelectBranch = (): void => {
    this.listOverdueFilter = this.listOverdue
      .filter((e) => e.branch_code == this.branchSelect)
      .sort(
        (a, b) =>
          parseInt(`${a.room_number}`.replace('/', '')) -
          parseInt(`${b.room_number}`.replace('/', ''))
      );
    console.log(this.listOverdueFilter);
  };
}
