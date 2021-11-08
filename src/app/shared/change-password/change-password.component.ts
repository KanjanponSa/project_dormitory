import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.scss'],
})
export class ChangePasswordComponent implements OnInit {
  public formChangePassword: FormGroup;

  constructor(public service: AppService, private formBuilder: FormBuilder) {
    this.service.setHeaderPage('changepassword', 'เปลี่ยนรหัสผ่าน');
  }

  ngOnInit() {
    this.formChangePassword = this.formBuilder.group({
      username: [`${this.service.getUserLogin()['username']}`],
      oldPassword: ['', [Validators.required, Validators.minLength(8)]],
      password: ['', [Validators.required]],
      re_password: ['', [Validators.required]],
    });
  }

  public onChangePassword = () => {
    console.log('Change');
  };
}
