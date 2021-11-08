import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { Router, Event, NavigationEnd } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import Swal from 'sweetalert2';
import { Title, Meta } from '@angular/platform-browser';
import { environment } from 'src/environments/environment';
import * as FileSaver from 'file-saver';
import * as XLSX from 'xlsx';
import pdfMake from './pdfmake/pdfmake';
import pdfFonts from './pdfmake/vfs_fonts';

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

const EXCEL_TYPE =
  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8';
const _window: any = window;

@Injectable({
  providedIn: 'root',
})
export class AppService {
  private currentRouter: string = '/';
  private currentRouterSubscribe: Observable<any>;
  private httpRootURL: string = environment.api_url;
  private userLogin: any = null;
  private showLoading: boolean = false;
  public month: Array<string> = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤษจิกายน',
    'ธันวาคม',
  ];
  public day: Array<string> = [
    'อาทิตย์',
    'จันทร์',
    'อังคาร',
    'พุธ',
    'พฤหัสบดี',
    'ศุกร์',
    'เสาร์',
  ];

  constructor(
    private router: Router,
    private http: HttpClient,
    private titleService: Title,
    private metaService: Meta
  ) {}

  exportAsPdfFile(arr: Array<any>) {
    const documentDefinition = this.getDocumentDefinition(arr);
    pdfMake.createPdf(documentDefinition).download('asdasd');
  }

  getTerm = () => {
    let dt = new Date();
    let gt = dt.getTime();

    let term1_start = new Date(dt.getFullYear(), 5, 16).getTime();
    let term1_end = new Date(dt.getFullYear(), 10, 15).getTime();
    let term3_start = new Date(dt.getFullYear(), 3, 16).getTime();
    let term3_end = new Date(dt.getFullYear(), 5, 15).getTime();

    if (gt >= term1_start && gt <= term1_end) {
      return 1;
    } else if (gt >= term3_start && gt <= term3_end) {
      return 3;
    } else {
      return 2;
    }
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
      ],
      defaultStyle: {
        font: 'THSarabun',
        fontSize: 14,
      },
    };
  }

  // ---------------------------------------------------- //

  public exportAsExcelFile(
    json: any[],
    excelFileName: string,
    typeFile = 'xls'
  ): void {
    const worksheet: XLSX.WorkSheet = XLSX.utils.json_to_sheet(json);
    const workbook: XLSX.WorkBook = {
      Sheets: { data: worksheet },
      SheetNames: ['data'],
    };
    const excelBuffer: any = XLSX.write(workbook, {
      bookType: typeFile == 'xls' ? 'xls' : 'xlsx',
      type: 'array',
    });

    this.saveAsExcelFile(excelBuffer, excelFileName, typeFile);
  }

  private saveAsExcelFile(
    buffer: any,
    fileName: string,
    extension: string
  ): void {
    const data: Blob = new Blob([buffer], { type: EXCEL_TYPE });
    FileSaver.saveAs(data, fileName + '.' + extension);
  }

  public strToInt = (value: string) => {
    return parseInt(value);
  };

  // ---------------------------------------------------- //

  public getRouter = (callback: (arg0: string) => void) => {
    this.currentRouterSubscribe = this.router.events;
    callback(this.currentRouter);
    this.currentRouterSubscribe.subscribe((value: Event) => {
      if (value instanceof NavigationEnd) {
        this.currentRouter = value.url;
        callback(this.currentRouter);
      }
    });
  };

  public navRouter = (path: string, params: any = {}) => {
    this.router.navigate([`${path}`], { queryParams: params });
  };

  // ---------------------------------------------------- //

  public setUserLogin = (data: any) => {
    this.userLogin = data;
    this.localStorage.set('userLogin', data);
  };

  public getUserLogin = () => {
    return this.userLogin;
  };

  // ---------------------------------------------------- //

  public localStorage = {
    get: (key: string) => {
      return JSON.parse(window.localStorage.getItem('dormitory_' + key));
    },
    set: (key: string, value: any) => {
      value = JSON.stringify(value);
      window.localStorage.setItem('dormitory_' + key, value);
    },
    clear: () => {
      window.localStorage.clear();
    },
  };

  // ---------------------------------------------------- //

  public httpPost = (url: string, payload: any) => {
    this.loading.show();
    return new Promise(async (resolve) => {
      await this.delay(1000);
      this.http
        .post(`${this.httpRootURL}${url}`, payload)
        .toPromise()
        .then((value: any) => {
          resolve(value);
          if (value?.isLogin == false) {
            this.showAlert('', value.message, 'warning');
            if (!this.currentRouter.includes('/login'))
              this.navRouter('/login', { oldPath: this.currentRouter });
            this.localStorage.clear();
          }
        })
        .catch((reason: any) => {
          resolve(null);
          console.log(reason);
          this.showAlert('', 'การเชื่อมต่อเซิร์ฟเวอร์ผิดพลาด', 'warning');
        })
        .finally(() => {
          this.loading.hide();
        });
    });
  };

  public httpGet = (url: string) => {
    this.loading.show();
    return new Promise(async (resolve) => {
      await this.delay(1000);
      this.http
        .get(`${this.httpRootURL}${url}`)
        .toPromise()
        .then((value: any) => {
          resolve(value);
          if (value?.isLogin == false) {
            this.showAlert('', value.message, 'warning');
            if (!this.currentRouter.includes('/login'))
              this.navRouter('/login', { oldPath: this.currentRouter });
            this.localStorage.clear();
          }
        })
        .catch((reason: any) => {
          resolve(null);
          console.log(reason);
          this.showAlert('', 'การเชื่อมต่อเซิร์ฟเวอร์ผิดพลาด', 'warning');
        })
        .finally(() => {
          this.loading.hide();
        });
    });
  };

  // ---------------------------------------------------- //

  public showAlert = (
    title: string,
    message: string,
    type: 'success' | 'warning' | 'error'
  ) => {
    Swal.fire({
      icon: type,
      title: title,
      text: message,
      confirmButtonText: 'ตกลง',
    });
  };

  public showConfirm = (
    title: string,
    message: string,
    type: 'success' | 'warning' | 'error'
  ) => {
    return new Promise((resolve) => {
      Swal.fire({
        title: title,
        text: message,
        icon: type,
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'ตกลง',
        cancelButtonText: 'ยกเลิก',
        focusCancel: true,
      }).then((result) => {
        if (result.value) {
          resolve(true);
        }
        resolve(false);
      });
    });
  };

  // ---------------------------------------------------- //

  public loading = {
    show: () => {
      this.showLoading = true;
    },
    hide: async () => {
      await this.delay(1000);
      this.showLoading = false;
    },
    status: () => {
      return this.showLoading;
    },
  };

  // ---------------------------------------------------- //

  public delay = (ms: number) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(null);
      }, ms);
    });
  };

  // ---------------------------------------------------- //

  public zeroPad = (nr, base) => {
    var len = String(base).length - String(nr).length + 1;
    return len > 0 ? new Array(len).join('0') + nr : nr;
  };

  // ---------------------------------------------------- //

  public setHeaderPage = (path: string, title: string = null) => {
    let canonical: any = document.getElementById('canonical');
    canonical['href'] = `${environment.url}${path}`;

    let alternate: any = document.getElementById('alternate');
    alternate['href'] = `${environment.url}${path}`;

    this.titleService.setTitle(
      `${
        title ? title + ' - ' : ''
      }ระบบเว็บแอปพลิเคชันการจัดการค่าใช้จ่ายนักศึกษา`
    );

    this.metaService.updateTag({
      name: 'keywords',
      content: `${
        title ? title + ', ' : ''
      } ระบบเว็บแอปพลิเคชันการจัดการค่าใช้จ่ายนักศึกษา, หอพักนักศึกษา, หอใน, เทคโน, เทคโนโคราช, rmuti, ค่าน้ำค่าไฟ, ค่าประกันหอ, ค่าใช้จ่ายหอใน, หอพักนักศึกษามหาวิทยาลัยเทคโนโลยีราชมงคลอีสาน, นครราชสีมา`,
    });
    this.metaService.updateTag({
      name: 'description',
      content:
        'เว็บแอปพลิเคชันจัดการในการเก็บข้อมูลหอพัก ค่าไฟหอพัก โดยการตรวจสอบสถานะของนักศึกษาที่ค้างชำระค่าหอพักนักศึกษา ค่าประกันหอพัก คำนวณการใช้หน่วยไฟฟ้าของแต่ละห้องคำนวณออกมา และสมารถสรุปผลเป็นรายเดือนรายปีได้ จึงได้ทำการเก็บข้อมูลจากหอพักนักศึกษาเก็บกับค่าใช้จ่ายและรายละเอียดต่าง ๆ จากสำนักงานหอพักนักศึกษามหาวิทยาลัยเทคโนโลยีราชมงคลอีสาน นครราชสีมา',
    });
    this.metaService.updateTag({ name: 'robots', content: 'index, follow' });
    this.metaService.updateTag({
      property: 'og:url',
      content: `${environment.url}${path}`,
    });
    this.metaService.updateTag({ property: 'og:type', content: `website` });
    this.metaService.updateTag({
      property: 'og:title',
      content: `${
        title ? title + ' - ' : ''
      }ระบบเว็บแอปพลิเคชันการจัดการค่าใช้จ่ายนักศึกษา`,
    });
    this.metaService.updateTag({
      property: 'og:description',
      content: `เว็บแอปพลิเคชันจัดการในการเก็บข้อมูลหอพัก ค่าไฟหอพัก โดยการตรวจสอบสถานะของนักศึกษาที่ค้างชำระค่าหอพักนักศึกษา ค่าประกันหอพัก คำนวณการใช้หน่วยไฟฟ้าของแต่ละห้องคำนวณออกมา และสมารถสรุปผลเป็นรายเดือนรายปีได้ จึงได้ทำการเก็บข้อมูลจากหอพักนักศึกษาเก็บกับค่าใช้จ่ายและรายละเอียดต่าง ๆ จากสำนักงานหอพักนักศึกษามหาวิทยาลัยเทคโนโลยีราชมงคลอีสาน นครราชสีมา`,
    });
    this.metaService.updateTag({
      property: 'og:image',
      content: `${environment.url}assets/img/RMUTI_LOGO.png`,
    });
    this.metaService.updateTag({
      property: 'twitter:card',
      content: `summary`,
    });
    this.metaService.updateTag({
      property: 'twitter:title',
      content: `${
        title ? title + ' - ' : ''
      }ระบบเว็บแอปพลิเคชันการจัดการค่าใช้จ่ายนักศึกษา`,
    });
    this.metaService.updateTag({
      property: 'twitter:image',
      content: `${environment.url}assets/img/RMUTI_LOGO.png`,
    });
    this.metaService.updateTag({
      property: 'twitter:description',
      content: `เว็บแอปพลิเคชันจัดการในการเก็บข้อมูลหอพัก ค่าไฟหอพัก โดยการตรวจสอบสถานะของนักศึกษาที่ค้างชำระค่าหอพักนักศึกษา ค่าประกันหอพัก คำนวณการใช้หน่วยไฟฟ้าของแต่ละห้องคำนวณออกมา และสมารถสรุปผลเป็นรายเดือนรายปีได้ จึงได้ทำการเก็บข้อมูลจากหอพักนักศึกษาเก็บกับค่าใช้จ่ายและรายละเอียดต่าง ๆ จากสำนักงานหอพักนักศึกษามหาวิทยาลัยเทคโนโลยีราชมงคลอีสาน นครราชสีมา`,
    });
  };

  ArabicNumberToText = (data) => {
    return _window.ArabicNumberToText(data);
  };
}
