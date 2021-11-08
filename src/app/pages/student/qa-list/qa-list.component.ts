import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-qa-list',
  templateUrl: './qa-list.component.html',
  styleUrls: ['./qa-list.component.scss'],
})
export class QaListComponent implements OnInit {
  public listQuestion: Array<any> = [];
  public insertQuestion: boolean = false;

  constructor(public service: AppService) {}

  ngOnInit(): void {
    this.getAllQuestion();
  }

  private getAllQuestion = () => {
    this.service.httpGet(`support/getStudentQuestion`).then((val: any) => {
      console.log(val);
      if (val.result.length > 0) {
        this.listQuestion = val.result;
      }
    });
  };

  public onInsertQuestion = (data) => {
    let dataRequest = {
      question: data.question,
      student: this.service.getUserLogin()['std_code'],
    };
    // console.log(dataRequest);

    this.service
      .httpPost(`support/studentQuestion`, JSON.stringify(dataRequest))
      .then((val: any) => {
        console.log(val);
        this.getAllQuestion();
      });
  };
}
