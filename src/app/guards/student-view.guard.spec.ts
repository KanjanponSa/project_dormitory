import { TestBed } from '@angular/core/testing';

import { StudentViewGuard } from './student-view.guard';

describe('StudentViewGuard', () => {
  let guard: StudentViewGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(StudentViewGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
