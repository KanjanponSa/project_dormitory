// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  ssoLogin:
    'http://www.cpe.rmuti.ac.th/project/QR_Student/sso/?sso&redirect=http://localhost:4200/login?sso=true',
  ssoLogout:
    'http://www.cpe.rmuti.ac.th/project/QR_Student/sso/?slo&redirect=http://localhost:4200/login',
  baseHref: '/',
  url: 'http://localhost:4200/',
  api_url : 'http://localhost/dormitory_rmuti/api/index.php/'
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
