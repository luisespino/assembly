.global _start

_start:
  mov x0, 5     // return value
  mov x8, 93    // exit syscall_num
  svc 0         // generic syscall
