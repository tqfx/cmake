#pragma once

typedef struct complex32 {
  float real;
  float imag;
} complex32;

// clang-format off
#define COMPLEX32_C(real, imag) {real##F, imag##F}
// clang-format on

typedef struct complex64 {
  float real;
  float imag;
} complex64;

// clang-format off
#define COMPLEX64_C(real, imag) {real, imag}
// clang-format on

#if defined(__cplusplus)
extern "C" {
#endif /* __cplusplus */

complex32 complex32_add(complex32 x, complex32 y);
complex32 complex32_sub(complex32 x, complex32 y);
complex32 complex32_mul(complex32 x, complex32 y);
complex32 complex32_div(complex32 x, complex32 y);
complex32 complex32_pow(complex32 x, complex32 y);
complex32 complex32_sqrt(complex32 x);
complex32 complex32_log(complex32 x);
complex32 complex32_sin(complex32 x);
complex32 complex32_cos(complex32 x);
complex32 complex32_tan(complex32 x);

#if defined(__cplusplus)
} /* extern "C" */
#endif /* __cplusplus */