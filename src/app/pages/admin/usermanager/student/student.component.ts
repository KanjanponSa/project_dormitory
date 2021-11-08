import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AppService } from 'src/app/services/app.service';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.scss'],
})
export class StudentComponent implements OnInit {
  public listAdminType: Array<any> = [];
  public listAdminUsers: Array<any> = [];
  public userForm: FormGroup;
  public userSelected: any = null;

  constructor(public service: AppService, private formBuilder: FormBuilder) {}

  async ngOnInit() {
    this.userForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      nameTitle: ['', [Validators.required]],
      fname: ['', [Validators.required]],
      lname: ['', [Validators.required]],
      type: ['0', [Validators.required]],
      role: ['student', [Validators.required]],
      password: [''],
      re_password: [''],
    });

    await this.getAdminType();
    await this.getAdminUsers();
  }

  private getAdminType = async () => {
    await this.service
      .httpGet(`/support/getAdminType`)
      .then((val) => {
        if (val['success']) {
          if (val['rowCount'] > 0) {
            this.listAdminType = val['result'].filter(
              (e) => e.type_name == 'นักศึกษา'
            );
          }
        }
      })
      .catch((reason) => {
        console.log(reason);
      });
  };

  public searchAdmin = (data: any) => {
    let searchDataArray = this.listAdminUsers.filter(
      (e) => JSON.stringify(e).indexOf(data.value) != -1
    );

    searchDataArray.length > 0 && [
      (this.userSelected = searchDataArray[0]),
      this.userForm.patchValue({
        username: searchDataArray[0]['username'],
        nameTitle: searchDataArray[0]['nameTitle'],
        fname: searchDataArray[0]['fname'],
        lname: searchDataArray[0]['lname'],
      }),
    ];

    searchDataArray.length == 0 && [
      (this.userSelected = null),
      this.service.showAlert('ไม่พบข้อมูล', '', 'warning'),
      (data.value = ''),
    ];
  };

  private getAdminUsers = async () => {
    await this.service
      .httpGet(`/support/getStudentUsers`)
      .then((val) => {
        console.log(val);
        if (val['success']) {
          if (val['rowCount'] > 0) {
            this.listAdminUsers = val['result'];
          }
        }
      })
      .catch((reason) => {
        console.log(reason);
      });
  };

  public formAdminSubmit = () => {
    let data = { ...this.userForm.value };
    if (`${data['password']}`.length > 0) {
      if (`${data['password']}` !== `${data['re_password']}`) {
        this.service.showAlert('รหัสผ่านไม่ตรงกัน', '', 'error');
        return;
      }
      this.service
        .httpPost('/support/updateStudentPassword', JSON.stringify(data))
        .then((val) => {
          console.log(val);
          this.service.showAlert('บันทึกข้อมูลสำเร็จ', '', 'success');
        })
        .catch((reason) => {
          console.log(reason);
        });
    } else {
      this.service
        .httpPost('/support/updateStudentData', JSON.stringify(data))
        .then((val) => {
          console.log(val);
          this.service.showAlert('บันทึกข้อมูลสำเร็จ', '', 'success');
        })
        .catch((reason) => {
          console.log(reason);
        });
    }
  };

  public reset = () => {
    window.location.reload();
  };
}
