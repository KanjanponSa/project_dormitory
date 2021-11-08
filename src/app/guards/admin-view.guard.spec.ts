import { TestBed } from '@angular/core/testing';

import { AdminViewGuard } from './admin-view.guard';

describe('AdminViewGuard', () => {
  let guard: AdminViewGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(AdminViewGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
