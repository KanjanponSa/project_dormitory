import { AppService } from './../../../services/app.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-cost-manage',
  templateUrl: './cost-manage.component.html',
  styleUrls: ['./cost-manage.component.scss'],
})
export class CostManageComponent implements OnInit {
  constructor(public service: AppService) {}

  ngOnInit(): void {}
}
