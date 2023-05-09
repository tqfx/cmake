#include "lib.h"
#include <stdio.h>
int main(int argc, char *argv[]) {
  complex32 x = COMPLEX32_C(3.0, 4.0);
  complex32 y = COMPLEX32_C(4.0, 3.0);
  {
    complex32 z = complex32_add(x, y);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  {
    complex32 z = complex32_sub(x, y);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  {
    complex32 z = complex32_mul(x, y);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  {
    complex32 z = complex32_div(x, y);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  {
    complex32 z = complex32_pow(x, y);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  {
    complex32 z = complex32_sqrt(x);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  {
    complex32 z = complex32_log(x);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  {
    complex32 z = complex32_sin(x);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  {
    complex32 z = complex32_cos(x);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  {
    complex32 z = complex32_tan(x);
    printf("(%g,%g)\n", z.real, z.imag);
  }
  return 0;
}
