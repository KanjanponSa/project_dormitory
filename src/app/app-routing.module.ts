import { DefaultLayoutComponent } from './components/default-layout/default-layout.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule, PreloadAllModules } from '@angular/router';
import { PrivateComponent } from './components/private/private.component';
import { CheckLoginGuard } from './guards/check-login.guard';
import { AdminViewGuard } from './guards/admin-view.guard';
import { NotfoundComponent } from './components/notfound/notfound.component';
import { StudentViewGuard } from './guards/student-view.guard';

const routes: Routes = [
  {
    path: '',
    component: DefaultLayoutComponent,
    children: [
      {
        path: 'login',
        loadChildren: () =>
          import('./pages/default/login/login.module').then(
            (m) => m.LoginModule
          ),
      },
      {
        path: 'register',
        loadChildren: () =>
          import('./pages/default/register/register.module').then(
            (m) => m.RegisterModule
          ),
      },
      {
        path: 'forget-password',
        loadChildren: () =>
          import('./pages/default/forget-password/forget-password.module').then(
            (m) => m.ForgetPasswordModule
          ),
      },
      {
        path: '',
        component: PrivateComponent,
        canActivate: [CheckLoginGuard],
        children: [
          {
            path: 'home',
            loadChildren: () =>
              import('./shared/home/home.module').then((m) => m.HomeModule),
          },
          {
            path: 'usermanager',
            canActivate: [AdminViewGuard],
            loadChildren: () =>
              import('./pages/admin/usermanager/usermanager.module').then(
                (m) => m.UsermanagerModule
              ),
          },
          {
            path: 'electric-bill',
            canActivate: [AdminViewGuard],
            loadChildren: () =>
              import('./pages/admin/electric-bill/electric-bill.module').then(
                (m) => m.ElectricBillModule
              ),
          },
          {
            path: 'history-electric-bill',
            canActivate: [AdminViewGuard],
            loadChildren: () =>
              import(
                './pages/admin/history-electric-bill/history-electric-bill.module'
              ).then((m) => m.HistoryElectricBillModule),
          },
          {
            path: 'student-cost',
            canActivate: [AdminViewGuard],
            loadChildren: () =>
              import('./pages/admin/student-cost/student-cost.module').then(
                (m) => m.StudentCostModule
              ),
          },
          {
            path: 'cost-manage',
            canActivate: [AdminViewGuard],
            loadChildren: () =>
              import('./pages/admin/cost-manage/cost-manage.module').then(
                (m) => m.CostManageModule
              ),
          },
          {
            path: 'cost-summary',
            canActivate: [AdminViewGuard],
            loadChildren: () =>
              import('./pages/admin/cost-summary/cost-summary.module').then(
                (m) => m.CostSummaryModule
              ),
          },
          {
            path: 'cost-overdue',
            canActivate: [AdminViewGuard],
            loadChildren: () =>
              import('./pages/admin/cost-overdue/cost-overdue.module').then(
                (m) => m.CostOverdueModule
              ),
          },
          {
            path: 'qa',
            canActivate: [AdminViewGuard],
            loadChildren: () =>
              import('./pages/admin/qa/qa.module').then((m) => m.QaModule),
          },
          {
            path: 'student',
            canActivate: [StudentViewGuard],
            loadChildren: () =>
              import('./pages/student/student.module').then(
                (m) => m.StudentModule
              ),
          },
          {
            path: 'changepassword',
            loadChildren: () =>
              import('./shared/change-password/change-password.module').then(
                (m) => m.ChangePasswordModule
              ),
          },
          {
            path: '',
            redirectTo: '/home',
            pathMatch: 'full',
          },
        ],
      },
      {
        path: '**',
        component: NotfoundComponent,
      },
    ],
  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {
      scrollPositionRestoration: 'enabled',
      preloadingStrategy: PreloadAllModules,
    }),
  ],
  exports: [RouterModule],
})
export class AppRoutingModule {}
