import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';
import dayGridPlugin from '@fullcalendar/daygrid';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent implements OnInit {
  public calendarPlugins = [dayGridPlugin];
  public listQuestion: Array<any> = [];

  constructor(public service: AppService) {
    this.service.setHeaderPage('home', 'หน้าหลัก');
  }

  ngOnInit() {
    if (this.service.getUserLogin()['role'] == 'admin') {
      // console.log('hello');
      this.getAllQuestion();
    }
  }

  private getAllQuestion = () => {
    this.service.httpGet(`support/getStudentQuestion`).then((val: any) => {
      console.log(val);
      if (val.result.length > 0) {
        this.listQuestion = val.result;
      }
    });
  };

  public onAnswer = (answer: string, data: any) => {
    data['answer'] = answer;
    data['admin'] = this.service.getUserLogin()['username'];

    this.service
      .httpPost(`support/adminAnswer`, JSON.stringify(data))
      .then((val: any) => {
        this.getAllQuestion();
        console.log(val);
      });
  };
}
