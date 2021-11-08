import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss'],
})
export class RegisterComponent implements OnInit {
  public formRegister: FormGroup;

  constructor(private formBuilder: FormBuilder, public service: AppService) {
    this.service.setHeaderPage('register', 'สร้างบัญชีผู้ใช้');
  }

  ngOnInit() {
    this.formRegister = this.formBuilder.group({
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

  public onRegister = () => {
    if (
      this.formRegister.value.password == this.formRegister.value.re_password
    ) {
      this.service
        .httpPost('/user/register', JSON.stringify(this.formRegister.value))
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
