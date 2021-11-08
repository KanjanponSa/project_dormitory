import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';
import { ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  private oldPath: string = '/home';
  public formLogin: FormGroup;

  constructor(
    public service: AppService,
    private activeRoute: ActivatedRoute,
    private formBuilder: FormBuilder
  ) {
    this.service.setHeaderPage('login', 'ลงชื่อเข้าใช้งาน');
  }

  async ngOnInit() {
    this.formLogin = this.formBuilder.group({
      username: ['', Validators.required],
      password: ['', Validators.required],
    });

    this.activeRoute.queryParams.subscribe((value: any) => {
      // console.log(value);
      if (value.oldPath) this.oldPath = value.oldPath;
      if (value.sso) {
        this.service
          .httpGet(`/user/getSSO?perid=${value.perid}`)
          .then((value: any) => {
            // console.log(value);
            if (value) {
              if (value.success) {
                this.service.setUserLogin(value.result);
                this.service.navRouter(this.oldPath);
              } else {
                this.service.showAlert('', value.message, 'error');
              }
            }
          });
      }
    });
  }

  public onLogin = () => {
    this.service
      .httpPost('/user/login', JSON.stringify(this.formLogin.value))
      .then((value: any) => {
        // console.log(value);
        if (value) {
          if (value.success) {
            this.service.setUserLogin(value.result);
            this.service.navRouter(this.oldPath);
          } else {
            this.service.showAlert('', value.message, 'error');
          }
        }
      });
  };

  public openSSO = () => {
    window.location.replace(environment.ssoLogin);
  };
}
