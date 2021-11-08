import { Component, OnInit } from '@angular/core';
import {
  Router,
  NavigationStart,
  NavigationEnd,
  NavigationCancel,
  NavigationError,
} from '@angular/router';
import { AppService } from './services/app.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  public loading = false;

  constructor(private router: Router, public service: AppService) {
    console.log(`Term : ${service.getTerm()}`);
    this.service.setHeaderPage('');
    this.router.events.subscribe(async (event) => {
      // console.log(this.router.url);

      switch (true) {
        case event instanceof NavigationStart: {
          this.loading = true;
          break;
        }

        case event instanceof NavigationEnd:
        case event instanceof NavigationCancel:
        case event instanceof NavigationError: {
          let baseHref: any = document.getElementById('baseHref');
          baseHref['href'] = environment.baseHref;
          this.loading = false;
          break;
        }
        default: {
          break;
        }
      }
    });
  }

  async ngOnInit() {
    this.service.getRouter((value: string) => {
      console.log(value);
    });
  }
}
