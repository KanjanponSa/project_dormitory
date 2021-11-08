import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-forget-password',
  templateUrl: './forget-password.component.html',
  styleUrls: ['./forget-password.component.scss'],
})
export class ForgetPasswordComponent implements OnInit {
  public formResetPassword: FormGroup;

  constructor(public service: AppService, private formBuilder: FormBuilder) {
    this.service.setHeaderPage('forget-password', 'ลืมรหัสผ่าน');
  }

  ngOnInit(): void {
    this.formResetPassword = this.formBuilder.group({
      fname: ['', Validators.required],
      lname: ['', Validators.required],
      std_code: [
        '',
        [
          Validators.required,
          Validators.minLength(13),
          Validators.maxLength(13),
        ],
      ],
      password: ['', [Validators.required, Validators.minLength(8)]],
      re_password: ['', [Validators.required, Validators.minLength(8)]],
    });
  }

  public onReset = async () => {
    if (
      this.formResetPassword.value.password ==
      this.formResetPassword.value.re_password
    ) {
      this.service
        .httpPost(
          '/user/resetPassword',
          JSON.stringify(this.formResetPassword.value)
        )
        .then((value: any) => {
          // console.log(value);
          if (value) {
            this.service.showAlert(
              '',
              value.message,
              value.success ? 'success' : 'error'
            );

            if (value.success) {
              this.service.navRouter('/login');
            }
          }
        });
    } else {
      this.service.showAlert('', 'รหัสผ่านไม่ตรงกัน', 'error');
    }
  };
}
